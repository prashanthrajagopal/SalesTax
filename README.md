<h1> Solution to Sales Tax Problem</h1>

<h2>The Question</h2>
Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional
sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the
items, and the total amounts of sales taxes paid.  The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains
(np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets...

<h3>INPUT:</h3>

```sh
$ ruby bin/tax < inputs/input3
```

1 imported bottle of perfume at 27.99

1 bottle of perfume at 18.99

1 packet of headache pills at 9.75

1 box of imported chocolates at 11.25



<h3>OUTPUT</h3>
Output 3:

1 imported bottle of perfume  =>  32.19

1 bottle of perfume =>  20.89

1 packet of headache pills  =>  9.75

1 box of imported chocolates  =>  11.85

Sales Tax total =>  6.7

Order Total =>  74.68

