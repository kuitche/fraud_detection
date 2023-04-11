-- loading data for card holder 2 and 18 from the database
SELECT t.id as transaction_id, ch.id as card_holder_id, date, amount, cc.card, m.name as merchant_name, mc.name as merchant_category, ch.name as card_holder_name 
FROM transaction t 
	INNER JOIN merchant m ON t.id_merchant = m.id
	INNER JOIN merchant_category mc ON m.id_merchant_category = mc.id
	INNER JOIN credit_card cc ON t.card = cc.card
	INNER JOIN card_holder ch ON cc.cardholder_id = ch.id
WHERE ch.id in (2, 18);

-- loading data of daily transactions from jan to jun 2018 for card holder 25
SELECT t.id as transaction_id, ch.id as card_holder_id, date, amount, cc.card, m.name as merchant_name, mc.name as merchant_category, ch.name as card_holder_name 
FROM transaction t 
	INNER JOIN merchant m ON t.id_merchant = m.id
    INNER JOIN merchant_category mc ON m.id_merchant_category = mc.id
    INNER JOIN credit_card cc ON t.card = cc.card
    INNER JOIN card_holder ch ON cc.cardholder_id = ch.id 
WHERE (date between '2018-01-01' and '2018-06-31') 
	AND ch.id = 25
ORDER BY date
;