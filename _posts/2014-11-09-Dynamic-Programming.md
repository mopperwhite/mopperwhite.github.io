---
title: 动态规划 攻略开始 (以及对XMUOJ1008的怨念)
layout: post
tags: 
    - Dynamic Programming
    - Algorithm
    - Note
    - BUG待修

---
动态规划 攻略开始
=================

动态规划搞不定感觉各种不爽于是上网搜打算攻略掉

看了一堆《程序设计引导及在线实践》终于搞清楚了

一个可以用递归解决的问题，如果它的子问题不会相互影响，就可以每次求出来之后把值先存着，防止重复运算

f(i,j,k) 的值存在 a\[i\]\[j\]\[k\]里

然后，既然可以递推出结果，那么递归过程可以倒过来用循环做出来

所以动态规划都是用循环

嗯

**尼玛**

但**还是不会做**

以下是今日练习

最大上升子序列长度

```C++
    #include <iostream>
    using namespace std;
    int num[100]={0};
    int aMaxLen[100]={0};
    int n;
    int main(){
        cin >> n;
        for(int i=0;i<n;i++)
            cin >> num[i];
        aMaxLen[0]=1;
        for(int i=1;i<n;i++){// 找出 1..i 中以 num[i] 结尾的最大子序列长度  因为每个最大子序列必是以某个 num[i] 结尾的，所以只要最后找出 aMaxLen 中最大的即可 
            int nTmp=0; 
            aMaxLen[i]=1; // 这个 num[i] 在以它结尾的最大子序列中占长度1 
            for(int j=0;j<i;j++) // 在 num[0] 到 num[i] 之间有 i 个数 
                    if(num[i]>num[j]) // 对每个 num[j] ，num[j] 所代表的子序列一定是升的 ， 而当  num[j] < num[i] 时， num[i] 接在 num[j]子序列后， 这个子序列还是升的 
                            if(nTmp<aMaxLen[j]) // 很好 ， 如果上一行得到的上升子序列 比现在手头的还要长
                                    nTmp=aMaxLen[j]; //那么就把手头的换成当前上升子序列    这部分很容易理解
            aMaxLen[i]=nTmp+1;  // 把 以 num[i] 结尾的最大上升子序列长度记下来  以备使用 
        }
        int nMax=-1;
        for(int i=0;i<n;i++)
            if(nMax<aMaxLen[i]) nMax=aMaxLen[i]; // 找出最长的子序列
        cout << nMax;
        return 0;
    }
```



顺便吐槽下[ACM.XMU-1018](http://acm.xmu.edu.cn/problem.php?id=1018)
-------

longlong都不够用

4000+位啊有没有

最后加一次MOD一次总算AC了……

第一个数据

然后喜闻乐见地超时了
```C++
    #include <iostream>
    using namespace std;
    int main(){
        long n,a,b,t,m,c;
        cin>>c;
        for(int j=0;j<c;j++){
                a=0;b=1;
                cin >> n>>m;
                for(long i=0;i<n-1;i++){
                        t=(a+b)%m;
                        a=b;
                        b=t;
                }
                cout<<t%m<<"\n";
        }
        return 0;
    }
```

**回头去群里问下好了**

备忘：代码高亮出不来
----------
不管是\`\`\`

还是\{\% highlisht \%\} 都不行

