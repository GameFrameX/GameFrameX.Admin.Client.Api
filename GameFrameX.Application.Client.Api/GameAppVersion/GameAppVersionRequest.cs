using System.ComponentModel.DataAnnotations;

namespace GameFrameX.Application.Client.Api.GameAppVersion;

/// <summary>
/// 
/// </summary>
public sealed class GameAppVersionRequest
{
    /// <summary>
    /// 语言
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    public string Language { get; set; }

    /// <summary>
    /// 包名
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    public string PackageName { get; set; }

    /// <summary>
    /// 程序版本
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    public string AppVersion { get; set; }

    /// <summary>
    /// 主渠道名称
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    public string Channel { get; set; }

    /// <summary>
    /// 平台
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    public string Platform { get; set; }
}