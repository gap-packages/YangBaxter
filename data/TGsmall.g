TGS:=[];

###Size2
TGS[2]:=rec(implemented:=1,size:=2,tg:=[]);
TGS[2].tg[1]:=rec(size:=2,list:=[(),(1,2)],tau:=());

###Size3
TGS[3]:=rec(implemented:=2,size:=3,tg:=[]);
TGS[3].tg[1]:=rec(size:=3,list:=[(),(1,2,3),(1,3,2)],tau:=());
TGS[3].tg[2]:=rec(size:=3,list:=[(),(1,2,3),(1,3,2)],tau:=(2,3));

###Size4
TGS[4]:=rec(implemented:=7,size:=4,tg:=[]);
TGS[4].tg[1]:=rec(size:=4,list:=[(),(1,2,3,4),(1,3)(2,4),(1,4,3,2)],tau:=());
TGS[4].tg[2]:=rec(size:=4,list:=[(),(1,2,3,4),(1,3)(2,4),(1,4,3,2)],tau:=(2,4));
TGS[4].tg[3]:=rec(size:=4,list:=[(),(1,2,3,4),(1,3)(2,4),(1,4,3,2)],tau:=(2,3,4));
TGS[4].tg[4]:=rec(size:=4,list:=[(),(1,2,3,4),(1,3)(2,4),(1,4,3,2)],tau:=(3,4));
TGS[4].tg[5]:=rec(size:=4,list:=[(),(3,4),(1,2),(1,2)(3,4)],tau:=());
TGS[4].tg[6]:=rec(size:=4,list:=[(),(3,4),(1,2),(1,2)(3,4)],tau:=(2,4));
TGS[4].tg[7]:=rec(size:=4,list:=[(),(3,4),(1,2),(1,2)(3,4)],tau:=(2,3,4));

###Size5
TGS[5]:=rec(implemented:=10,size:=5,tg:=[]);
TGS[5].tg[1]:=rec(size:=5,list:=[(),(1,2,3,4,5),(1,3,5,2,4),(1,4,2,5,3),(1,5,4,3,2)],tau:=());
TGS[5].tg[2]:=rec(size:=5,list:=[(),(1,2,3,4,5),(1,3,5,2,4),(1,4,2,5,3),(1,5,4,3,2)],tau:=(2,5));
TGS[5].tg[3]:=rec(size:=5,list:=[(),(1,2,3,4,5),(1,3,5,2,4),(1,4,2,5,3),(1,5,4,3,2)],tau:=(2,3,5));
TGS[5].tg[4]:=rec(size:=5,list:=[(),(1,2,3,4,5),(1,3,5,2,4),(1,4,2,5,3),(1,5,4,3,2)],tau:=(2,4,5));
TGS[5].tg[5]:=rec(size:=5,list:=[(),(1,2,3,4,5),(1,3,5,2,4),(1,4,2,5,3),(1,5,4,3,2)],tau:=(3,5));
TGS[5].tg[6]:=rec(size:=5,list:=[(),(1,2,3,4,5),(1,3,5,2,4),(1,4,2,5,3),(1,5,4,3,2)],tau:=(2,4,5,3));
TGS[5].tg[7]:=rec(size:=5,list:=[(),(1,2,3,4,5),(1,3,5,2,4),(1,4,2,5,3),(1,5,4,3,2)],tau:=(2,5,3,4));
TGS[5].tg[8]:=rec(size:=5,list:=[(),(1,2,3,4,5),(1,3,5,2,4),(1,4,2,5,3),(1,5,4,3,2)],tau:=(2,4)(3,5));
TGS[5].tg[9]:=rec(size:=5,list:=[(),(1,2,3,4,5),(1,3,5,2,4),(1,4,2,5,3),(1,5,4,3,2)],tau:=(2,3,5,4));
TGS[5].tg[10]:=rec(size:=5,list:=[(),(1,2,3,4,5),(1,3,5,2,4),(1,4,2,5,3),(1,5,4,3,2)],tau:=(2,5)(3,4));

###Size6
TGS[6]:=rec(implemented:=64,size:=6,tg:=[]);
TGS[6].tg[1]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=());
TGS[6].tg[2]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6));
TGS[6].tg[3]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3,6));
TGS[6].tg[4]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,4,6));
TGS[6].tg[5]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,5,6));
TGS[6].tg[6]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(3,6));
TGS[6].tg[7]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6,3));
TGS[6].tg[8]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3));
TGS[6].tg[9]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,4,6,3));
TGS[6].tg[10]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,5,6,3));
TGS[6].tg[11]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(3,4,6));
TGS[6].tg[12]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6,3,4));
TGS[6].tg[13]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3,4));
TGS[6].tg[14]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,4)(3,6));
TGS[6].tg[15]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,5,6,3,4));
TGS[6].tg[16]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(3,5,6));
TGS[6].tg[17]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6,3,5));
TGS[6].tg[18]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,4,6,3,5));
TGS[6].tg[19]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,5)(3,6));
TGS[6].tg[20]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(4,6));
TGS[6].tg[21]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6,4));
TGS[6].tg[22]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3,6,4));
TGS[6].tg[23]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,4));
TGS[6].tg[24]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,5,6,4));
TGS[6].tg[25]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(3,6,4));
TGS[6].tg[26]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6,4,3));
TGS[6].tg[27]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3)(4,6));
TGS[6].tg[28]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,5,6,4,3));
TGS[6].tg[29]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6)(3,4));
TGS[6].tg[30]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3,4,6));
TGS[6].tg[31]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,4,3,6));
TGS[6].tg[32]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,5,6)(3,4));
TGS[6].tg[33]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(3,5,6,4));
TGS[6].tg[34]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6,4,3,5));
TGS[6].tg[35]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3,5)(4,6));
TGS[6].tg[36]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,5)(3,6,4));
TGS[6].tg[37]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(4,5,6));
TGS[6].tg[38]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6,4,5));
TGS[6].tg[39]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3,6,4,5));
TGS[6].tg[40]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,5)(4,6));
TGS[6].tg[41]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(3,6,4,5));
TGS[6].tg[42]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6,4,5,3));
TGS[6].tg[43]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3)(4,5,6));
TGS[6].tg[44]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,5,3)(4,6));
TGS[6].tg[45]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6)(3,4,5));
TGS[6].tg[46]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3,4,5,6));
TGS[6].tg[47]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,4,5,3,6));
TGS[6].tg[48]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(3,5)(4,6));
TGS[6].tg[49]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6,4)(3,5));
TGS[6].tg[50]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3,5,6,4));
TGS[6].tg[51]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,5,3,6,4));
TGS[6].tg[52]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(5,6));
TGS[6].tg[53]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,4,6,5));
TGS[6].tg[54]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6,5,3));
TGS[6].tg[55]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3)(5,6));
TGS[6].tg[56]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(3,4,6,5));
TGS[6].tg[57]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6,5,3,4));
TGS[6].tg[58]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3,4)(5,6));
TGS[6].tg[59]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6)(3,5));
TGS[6].tg[60]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,5,3,6));
TGS[6].tg[61]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,4)(5,6));
TGS[6].tg[62]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,6,5)(3,4));
TGS[6].tg[63]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,3,4,6,5));
TGS[6].tg[64]:=rec(size:=6,list:=[(),(3,4,5),(3,5,4),(1,2),(1,2)(3,4,5),(1,2)(3,5,4)],tau:=(2,4,5)(3,6));

###Size7
TGS[7]:=rec(implemented:=136,size:=7,tg:=[]);
TGS[7].tg[1]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=());
TGS[7].tg[2]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7));
TGS[7].tg[3]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,7));
TGS[7].tg[4]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,7));
TGS[7].tg[5]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,7));
TGS[7].tg[6]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7));
TGS[7].tg[7]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(3,7));
TGS[7].tg[8]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3));
TGS[7].tg[9]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,7,3));
TGS[7].tg[10]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,7,3));
TGS[7].tg[11]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7,3));
TGS[7].tg[12]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(3,4,7));
TGS[7].tg[13]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,3,4));
TGS[7].tg[14]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4)(3,7));
TGS[7].tg[15]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,7,3,4));
TGS[7].tg[16]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,3,5));
TGS[7].tg[17]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,5));
TGS[7].tg[18]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,7,3,5));
TGS[7].tg[19]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5)(3,7));
TGS[7].tg[20]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7,3,5));
TGS[7].tg[21]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,3,6));
TGS[7].tg[22]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,7,3,6));
TGS[7].tg[23]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,7,3,6));
TGS[7].tg[24]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6)(3,7));
TGS[7].tg[25]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,7,4));
TGS[7].tg[26]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(3,7,4));
TGS[7].tg[27]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,4,3));
TGS[7].tg[28]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3)(4,7));
TGS[7].tg[29]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,7,4,3));
TGS[7].tg[30]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7,4,3));
TGS[7].tg[31]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7)(3,4));
TGS[7].tg[32]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,4,7));
TGS[7].tg[33]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,3,7));
TGS[7].tg[34]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,7)(3,4));
TGS[7].tg[35]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7)(3,4));
TGS[7].tg[36]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,4,3,5));
TGS[7].tg[37]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,5)(4,7));
TGS[7].tg[38]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,3,5));
TGS[7].tg[39]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5)(3,7,4));
TGS[7].tg[40]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7,4,3,5));
TGS[7].tg[41]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(3,6,7,4));
TGS[7].tg[42]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,4,3,6));
TGS[7].tg[43]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,6)(4,7));
TGS[7].tg[44]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,7,4,3,6));
TGS[7].tg[45]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6)(3,7,4));
TGS[7].tg[46]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,4,5));
TGS[7].tg[47]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,7,4,5));
TGS[7].tg[48]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5)(4,7));
TGS[7].tg[49]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7,4,5));
TGS[7].tg[50]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,4,5,3));
TGS[7].tg[51]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3)(4,5,7));
TGS[7].tg[52]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,3)(4,7));
TGS[7].tg[53]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7,4,5,3));
TGS[7].tg[54]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7)(3,4,5));
TGS[7].tg[55]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,4,5,7));
TGS[7].tg[56]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,3,4,7));
TGS[7].tg[57]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7)(3,4,5));
TGS[7].tg[58]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,4)(3,5));
TGS[7].tg[59]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7,4)(3,5));
TGS[7].tg[60]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,4,5,3,6));
TGS[7].tg[61]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,6)(4,5,7));
TGS[7].tg[62]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,5,3,6));
TGS[7].tg[63]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,3,6)(4,7));
TGS[7].tg[64]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6)(3,7,4,5));
TGS[7].tg[65]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(4,6,7));
TGS[7].tg[66]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,7,4,6));
TGS[7].tg[67]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(3,7,4,6));
TGS[7].tg[68]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7)(3,4,6));
TGS[7].tg[69]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,6,3,7));
TGS[7].tg[70]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,3,4,7));
TGS[7].tg[71]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,4,6,3,5));
TGS[7].tg[72]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,5)(4,6,7));
TGS[7].tg[73]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,3,5)(4,7));
TGS[7].tg[74]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(3,6)(4,7));
TGS[7].tg[75]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,7,4)(3,6));
TGS[7].tg[76]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,7,5));
TGS[7].tg[77]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3)(5,7));
TGS[7].tg[78]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,4)(5,7));
TGS[7].tg[79]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7,5,3,4));
TGS[7].tg[80]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,5,7));
TGS[7].tg[81]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,6)(5,7));
TGS[7].tg[82]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,7,5,3,6));
TGS[7].tg[83]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6)(3,7,5));
TGS[7].tg[84]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,7,5,4));
TGS[7].tg[85]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7,5,4));
TGS[7].tg[86]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3)(4,7,5));
TGS[7].tg[87]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,4,7,5));
TGS[7].tg[88]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,3,7,5));
TGS[7].tg[89]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7,5)(3,4));
TGS[7].tg[90]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7)(3,5,4));
TGS[7].tg[91]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,5,4,7));
TGS[7].tg[92]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,5,4,3,6));
TGS[7].tg[93]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,6)(4,7,5));
TGS[7].tg[94]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,3,6)(5,7));
TGS[7].tg[95]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7)(4,5));
TGS[7].tg[96]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,7)(4,5));
TGS[7].tg[97]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,3,4,5));
TGS[7].tg[98]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,5)(3,7));
TGS[7].tg[99]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5)(3,4,7));
TGS[7].tg[100]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7,3,4,5));
TGS[7].tg[101]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4)(3,5,7));
TGS[7].tg[102]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,7,3,5,4));
TGS[7].tg[103]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,3,6)(4,5));
TGS[7].tg[104]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,5,7,3,6));
TGS[7].tg[105]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,4,7,3,6));
TGS[7].tg[106]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6)(3,7)(4,5));
TGS[7].tg[107]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,7,5,4,6));
TGS[7].tg[108]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3)(4,6,7,5));
TGS[7].tg[109]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,3)(4,7,5));
TGS[7].tg[110]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,3,4,7,5));
TGS[7].tg[111]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7)(3,5,4,6));
TGS[7].tg[112]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,3,5,4,7));
TGS[7].tg[113]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,6,7,5,4));
TGS[7].tg[114]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,4)(5,6,7));
TGS[7].tg[115]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,3,4)(5,7));
TGS[7].tg[116]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,7,5)(3,6));
TGS[7].tg[117]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,7,5,6,4));
TGS[7].tg[118]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3)(4,7,5,6));
TGS[7].tg[119]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,3)(5,6,7));
TGS[7].tg[120]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,4,3)(5,7));
TGS[7].tg[121]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,3,7,5,6));
TGS[7].tg[122]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6)(3,4)(5,7));
TGS[7].tg[123]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,5,6,4,7));
TGS[7].tg[124]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,4)(3,5,7));
TGS[7].tg[125]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,4,5)(3,7));
TGS[7].tg[126]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3)(4,6)(5,7));
TGS[7].tg[127]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,4,6,7,5,3));
TGS[7].tg[128]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,4,7,5,3));
TGS[7].tg[129]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7)(3,5)(4,6));
TGS[7].tg[130]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,4,7)(3,5));
TGS[7].tg[131]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,5)(4,7,6));
TGS[7].tg[132]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,3,5,7,6,4));
TGS[7].tg[133]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7)(3,6)(4,5));
TGS[7].tg[134]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,7,3,6,5,4));
TGS[7].tg[135]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,6,5,7,3,4));
TGS[7].tg[136]:=rec(size:=7,list:=[(),(1,2,3,4,5,6,7),(1,3,5,7,2,4,6),(1,4,7,3,6,2,5),(1,5,2,6,3,7,4),(1,6,4,2,7,5,3),
(1,7,6,5,4,3,2)],tau:=(2,5,3)(4,6,7));


