Add-Type -AssemblyName System.Drawing

# 图片路径
$imagePath = "static\img\touxiang1.png"

# 读取图片并获取尺寸
$image = [System.Drawing.Image]::FromFile($imagePath)
$width = $image.Width
$height = $image.Height

# 释放资源
$image.Dispose()

# 输出结果
Write-Host "图片尺寸: $width x $height"

# 验证尺寸是否为640x640
if ($width -eq 640 -and $height -eq 640) {
    Write-Host "✓ 图片尺寸正确"
} else {
    Write-Host "✗ 图片尺寸不正确，期望640x640"
}