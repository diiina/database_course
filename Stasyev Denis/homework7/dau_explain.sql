id,select_type,table,partitions,type,possible_keys,key,key_len,ref,rows,filtered,Extra
1,PRIMARY,<derived2>,NULL,ALL,NULL,NULL,NULL,NULL,3,100.00,"Using temporary; Using filesort"
1,PRIMARY,payments_in,NULL,ALL,NULL,NULL,NULL,NULL,6000,100.00,"Using where; Using join buffer (Block Nested Loop)"
2,DERIVED,payments_in,NULL,ALL,NULL,NULL,NULL,NULL,6000,100.00,NULL
3,UNION,cte,NULL,ALL,NULL,NULL,NULL,NULL,2,100.00,"Recursive; Using where"
5,SUBQUERY,payments_in,NULL,ALL,NULL,NULL,NULL,NULL,6000,100.00,NULL
