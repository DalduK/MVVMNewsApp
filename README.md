# MVVMNewsApp 📰
Basic News App designed for MVVM learning purpouses!

## Overview

MVVM News App utilizes the power of the ["NewsAPI"](https://newsapi.org/) to seamlessly fetch and present news data to users. This project was crafted two years ago as a journey into the fundamentals of MVVM architecture.


## Getting Started

To kickstart your exploration:

1. Clone the repository.
2. Navigate to `ArticleManager` and replace `"ApiKeyHere"` with your personal key from [NewsAPI.org](https://newsapi.org/).

```swift
// ArticleManager.swift

struct ArticleManager {
    let url: String
    let apiKey = "ApiKeyHere"
    var delegate: ArticleManagerDelegate?
    // ...
}
```
