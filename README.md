**Simulate Virtual Account (VA) Payment with CURL:**

- curl -X POST
    https://api.xendit.co/v2/virtual_account_numbers/VIRTUAL_ACCOUNT_ID/payments
    -H 'Content-Type: application/json'
    -u 'xnd_development_YOUR_SECRET_KEY:'
    -d '{}'

_Notes: 
- replace your simulated VA on 'virtual_account_numbers' and Xendit API Key, actually I could just paste it here
- fill the brackets with the amount/total price, or maybe don't include it, I think it's automated filling the price_

**Ngrok:**
- https://precisely-included-killdeer.ngrok-free.app/~folder_project~/payment-callback
