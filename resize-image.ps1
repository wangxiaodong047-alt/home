Add-Type -AssemblyName System.Drawing

# 图片路径
$imagePath = "static\img\touxiang1.png"
$tempPath = "static\img\touxiang1_temp.png"
$outputPath = "static\img\touxiang1.png"

# 读取图片
$image = [System.Drawing.Image]::FromFile($imagePath)

# 创建新的图片对象，设置尺寸为640x640
$newImage = New-Object System.Drawing.Bitmap(640, 640)
$graphics = [System.Drawing.Graphics]::FromImage($newImage)
$graphics.DrawImage($image, 0, 0, 640, 640)

# 释放原始图片资源
$image.Dispose()

# 保存到临时文件
$newImage.Save($tempPath, [System.Drawing.Imaging.ImageFormat]::Png)

# 释放资源
$graphics.Dispose()
$newImage.Dispose()

# 删除原文件并将临时文件重命名为原文件名
Remove-Item -Path $outputPath -Force
Rename-Item -Path $tempPath -NewName (Split-Path -Leaf $outputPath)

Write-Host "图片已调整为640x640尺寸"