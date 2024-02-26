FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["GameFrameX.Web.Api/GameFrameX.Web.Api.csproj", "GameFrameX.Web.Api/"]
COPY ["GameFrameX.Application.Client.Api/GameFrameX.Application.Client.Api.csproj", "GameFrameX.Application.Client.Api/"]
COPY ["GameFrameX.Core.Options/GameFrameX.Core.Options.csproj", "GameFrameX.Core.Options/"]
COPY ["GameFrameX.Entity.Client/GameFrameX.Entity.Client.csproj", "GameFrameX.Entity.Client/"]
COPY ["GameFrameX.Entity/GameFrameX.Entity.csproj", "GameFrameX.Entity/"]
RUN dotnet restore "GameFrameX.Web.Api/GameFrameX.Web.Api.csproj"
COPY . .
WORKDIR "/src/GameFrameX.Web.Api"
RUN dotnet build "GameFrameX.Web.Api.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "GameFrameX.Web.Api.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "GameFrameX.Web.Api.dll"]
