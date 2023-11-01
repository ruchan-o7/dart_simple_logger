Simple logger for dart. I know this is very simple but i want to use this my other projects.

## Features
3 options available for now:
1)  Information
2)  Warning
3)  Error

## Getting started
Create a logger builder 
```dart
final lb = LoggerBuilder().CreateBuilder();
final logger = lb.Create();
```

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
logger.LogInformation("Some information");
```

## Additional information

You can change log colors with builder while building.
```dart
logger = LoggerBuilder.CreateBuilder()
  .SetEnabled(true)
  .SetPrefix("*")
  .SetInfoColor(LogColor.Green)
  .Create();
```
