<#
 .SYNOPSIS
  Lightweight Zero-Dependency Local Web Server for Hamza Fashion Embroidery
  Runs natively on Windows PowerShell without requiring Node.js or Python.
#>

$port = 8080
$prefix = "http://localhost:$port/"
$baseDir = $PSScriptRoot

if (-not $baseDir) {
    $baseDir = Get-Location
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)

try {
    $listener.Start()
} catch {
    Write-Host "[!] Port $port in use, attempting port 8081..." -ForegroundColor Yellow
    $port = 8081
    $prefix = "http://localhost:$port/"
    $listener = New-Object System.Net.HttpListener
    $listener.Prefixes.Add($prefix)
    $listener.Start()
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   HAMZA FASHION EMBROIDERY - LOCAL TEST SERVER" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "Server running at: $prefix" -ForegroundColor Yellow
Write-Host "Storefront URL:    ${prefix}index.html" -ForegroundColor White
Write-Host "Admin Portal:      ${prefix}dashboard.html" -ForegroundColor White
Write-Host "Admin Login:       admin / Hamza@123" -ForegroundColor Gray
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "Press Ctrl + C in this window to stop the server.`n" -ForegroundColor DarkGray

# Open default browser
Start-Process "${prefix}index.html"

# MIME Type mapper
$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".htm"  = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".mjs"  = "application/javascript; charset=utf-8"
    ".json" = "application/json; charset=utf-8"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".png"  = "image/png"
    ".gif"  = "image/gif"
    ".svg"  = "image/svg+xml"
    ".ico"  = "image/x-icon"
    ".woff2"= "font/woff2"
    ".woff" = "font/woff"
    ".ttf"  = "font/ttf"
}

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $rawUrl = $request.RawUrl.Split('?')[0].TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($rawUrl) -or $rawUrl -eq "/") {
            $rawUrl = "index.html"
        }

        # Decode path
        $decodedUrl = [System.Uri]::UnescapeDataString($rawUrl).Replace('/', '\')
        $filePath = Join-Path $baseDir $decodedUrl

        # Add CORS & Cache control headers
        $response.Headers.Add("Access-Control-Allow-Origin", "*")
        $response.Headers.Add("Cache-Control", "no-cache, no-store, must-revalidate")

        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $mime = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }
            $response.ContentType = $mime

            $buffer = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $buffer.Length
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
            $response.StatusCode = 200
            Write-Host " [200 OK]  $rawUrl ($mime)" -ForegroundColor Green
        } else {
            $response.StatusCode = 404
            $errBytes = [System.Text.Encoding]::UTF8.GetBytes("<h1>404 Not Found</h1><p>File not found: $rawUrl</p>")
            $response.ContentType = "text/html"
            $response.ContentLength64 = $errBytes.Length
            $response.OutputStream.Write($errBytes, 0, $errBytes.Length)
            Write-Host " [404]     $rawUrl" -ForegroundColor Red
        }

        $response.OutputStream.Close()
    } catch {
        if (-not $listener.IsListening) { break }
    }
}
