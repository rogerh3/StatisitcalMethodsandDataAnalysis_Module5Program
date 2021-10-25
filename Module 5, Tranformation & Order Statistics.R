#Roger H Hayden III
#10/4/2021
#Statistical Methods and Data Analysis
#Transformation & Order Statistics - Module 5

# Transformation & Order Statistics

# This week we will use software to reinforce the results for transformation of random variables
# and order statistics. It is a continuation of the simulation activities and distribution work we have
# done over the last two weeks. There are two problems.

# (1) Using a generator for a binomial distribution, we will test the results of Example 3.8.2. Using
# software generate 500 random deviates for X from a B(10, 0.3) distribution and 500 random
# deviates for Y from a B(5, 0.3) distribution. Add corresponding random deviates from each
# distribution to form an empirical W=X+Y. Then use the theoretical result of Example 3.8.2 and
# directly generate another 500 random deviates for W, call it W1 from a B(15, 0.3). Order the
# result of the sum of W=X+Y and of W1. As an empirical test of the equivalence of the
# distributions, you could do a few things. You could create a scatter plot of the random deviates of
# W1 on the random deviates of W=X+Y. It won’t be real pretty, but values should follow a line
# y=x. Or you could plot histograms of W1 and W on the same graph. (In R you call the two 
#histogram commands and on the 2nd add the argument, add=T)

x=rbinom(500,10,0.3)
y=rbinom(500,5,0.3)
w=y/x
w1=rbinom(500,15,0.3)
plot(w,w1)
hist(W,breaks=10,col=red,prob=T)
hist(W1,breaks=10,col=blue,prob=T,add=T)


# (2) Take the same approach for Example 3.8.5, first simulating W=Y/X and then simulating from
# the distribution representing the theoretical result of the ratio of Y and X. You need a little more
# guidance here. By Example 3.8.5 any exponential with rate lambda will suffice for Y and X, just
# use the same lambda, say lambda =1. The ratio will give random values for W. To establish
# random values of W directly from the density found for Example 3.8.5; that is, 1/(1+w)^2, you
# need a little help. And here it is. A random deviate for w can be delivered by {1/(1-r)}-1. I would
# generate a couple thousand random deviates for W=Y/X and for Wdev={1/(1-r)}-1. Next sort
# both random number sets from smallest to largest. Next, trim maybe the top 5%. That is,
# eliminate them. The reason is that if you don’t, the Y/X is going to occasionally give you some
# huge values, which when plotted the way I am recommending will change the scale substantially.
# So just be satisfied with the lower 95%. Last plot the lower 95% ordered Y/X with the lower
# 95% Wdev to assess agreement. You should see values on a line with slope 1.

x=rexp(2000,1)
y=rexp(2000,1)
w=y/x
r=runif(2000,0.1)
w_dev=1/(1-r)-1
w=sort(w)
w=w[1:2000*0.95]
w_d=sort(w_dev)
w_d=w_d[1:2000*0.95]
plot(w,w_d)

#Where did {1/(1-r)}-1 come from? For continuous distributions, the distribution function F(w) is
# distributed as a U(0,1) random variable. We use this fact to establish random deviates. So we
# equate a uniform random number r with the distribution function F(w). You can verify this, by
# getting F(w) for yourself, but it works out to be r=1-1/(1+w). Solving for w gives the relationship
# above. That is how most random number generators are established for specific distributions!