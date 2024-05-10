# ASP.NET 7 SQLite Template

This is a ready-to-go ASP.NET 7 template with SQLite setup. If you are on Mac like me and SQL setup takes too much time, give this a try. You don't need Docker to host SQLite on Mac, which makes prototyping so much simpler.

## Quick Start

1. **Install Missing NuGet Packages**

Run the following command in the terminal to install any missing packages

```
dotnet restore
```

Add-Migration

```
dotnet ef migrations add InitialCreate
```
Update database
```
dotnet ef database update
```
This will create 2 tables, Products and Customers, just to test if it's working or not.
