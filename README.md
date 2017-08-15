# practice_predict_price

Everything is under cooking, just a experimental project for making money by deep learning.

[Try to crawl]

	a. Noble Metals History Price - done (maybe replace by furtures price)
	b. Exchange Rate History - done
	c. Global Stock-Index History - done
	d. Futures History - done
	e. Some informantions from the Social Media? TBD
	f. Google Search Rate by keywords? TBD
	g. Trading volume? I reckon it can improve the accuracy of predition. TBD

[Try to predict]

	a. Exchange rate - GBP/USD
	b. Price - Gold

[Finished Items]

	a. Crawl - Noble Metals (Shell Script Only, need to install w3m for parsing html)
	b. Crawl - Exchange Rate (crawl the webpage directly, because of too many limitations in using nowapi)
	c. Crawl - Global Stock
	d. Crawl - Futures Price

[TODO]

	a. deside the format of input data
		1. translate the Product Name from Chinese to English
		2. the data format of input won't include the product name, just the daliy price and gap
		3. we need a mapping table for product name (debugging purpose. If some products don't influence the target product,
		removing it from input may reduce the cost of traning.)
	b. design the target market that we want to predict (2 options now, maybe I can do more when I get a more powerful PC)
	c. implementation of deep learning
		1. implement - data input
		2. implement - learing model
		3. training
		4. implement - prediction
		5. implement - validation

[Depends Package]

    a. w3m

That's all~ Good Luck
