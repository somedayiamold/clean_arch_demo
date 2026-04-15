# domain/valueobject/

值对象 — 不可变、通过值相等判断、自带校验。

## 示例

```go
// money.go

const (
    CurrencyCNY = "CNY"
    CurrencyUSD = "USD"
)

type Money struct {
    Amount   int64  // 最小货币单位（分）
    Currency string
}

func NewMoney(amount int64, currency string) (Money, error) {
    if amount < 0 {
        return Money{}, errors.New("amount must be non-negative")
    }
    return Money{Amount: amount, Currency: currency}, nil
}
```
