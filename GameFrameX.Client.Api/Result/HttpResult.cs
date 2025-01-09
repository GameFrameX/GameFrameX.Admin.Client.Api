namespace GameFrameX.Client.Api.Result;

/// <summary>
/// 消息返回统一结构
/// </summary>
public class HttpResult
{
    /// <summary>
    /// 消息码
    /// </summary>
    public HttpStatusCode code { get; set; }

    /// <summary>
    /// 消息内容
    /// </summary>
    public string message { get; set; }

    /// <summary>
    /// 实际数据
    /// </summary>
    public object data { get; set; }

    /// <summary>
    /// 创建一个带有指定代码、消息和数据的 ResultModel 实例
    /// </summary>
    /// <param name="code">结果代码</param>
    /// <param name="message">结果消息</param>
    /// <param name="data">结果数据</param>
    /// <returns>带有指定代码、消息和数据的 ResultModel 实例</returns>
    public static HttpResult Create(HttpStatusCode code, string message, object data)
    {
        return new HttpResult() { code = code, message = message, data = data };
    }

    /// <summary>
    /// 创建一个默认的 ResultModel 实例
    /// </summary>
    /// <returns>默认的 ResultModel 实例</returns>
    public static HttpResult Create()
    {
        return new HttpResult() { code = HttpStatusCode.Ok, message = HttpStatusCode.Ok.GetString() };
    }

    /// <summary>
    /// 创建一个带有指定代码和消息的 ResultModel 实例
    /// </summary>
    /// <param name="code">结果代码</param>
    /// <param name="message">结果消息</param>
    /// <returns>带有指定代码和消息的 ResultModel 实例</returns>
    public static HttpResult Create(HttpStatusCode code, string message)
    {
        return new HttpResult() { code = code, message = message };
    }

    /// <summary>
    /// 创建一个带有指定数据的 ResultModel 实例
    /// </summary>
    /// <param name="data">结果数据</param>
    /// <returns>带有指定数据的 ResultModel 实例</returns>
    public static HttpResult Create(object data)
    {
        return new HttpResult() { code = HttpStatusCode.Ok, message = HttpStatusCode.Ok.GetString(), data = data };
    }
}