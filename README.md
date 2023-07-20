# Assignment 2: Protests
In recent years the United States has experienced a surge of protests, in support of Black Lives Matter, gender equity, and many other social or political issues.

In this assignment, you will work with data from [Count Love](https://countlove.org/), data that is ocassionally [cited](https://www.nytimes.com/2020/08/28/us/black-lives-matter-protest.html) by the _New York Times_ when reporting on US demonstrations.

Through this assignment, you will be able to answer questions about protests, including:

* What were the most attended and least attended protests in the US in the last 5 years?
* How many protests occurred in Washington state?
* How did the number of protests in 2019 compare to 2020, and why?
* Why are people protesting in the US? What are the biggest motivators?

## Learning objectives
By completing the assignment, you will develop or skills for:

- **Version control** tools for managing code (git and GitHub)
- Writing documents with **markdown** syntax
- Coding in R
- Thinking critcally about data.

# 1. Critical Analysis & Reflection: Before You Code

Before diving into this (or any) dataset, it's important to know where the data came from, and it's important to have or to seek out _domain familiarity_ — that is, knowledge about the topic of the dataset. Sometimes the topic is very narrow; more often it is expansive, as in the case of CountLove. We don't want to be "strangers in the dataset," as Catherine D'Ignazio and Lauren Klein describe it. To get more familiar, we are going to begin by doing some background reading.

**Note:** Please write your answers below under the heading "Your Responses and Reflections."

- First, please read [this FAQ](https://countlove.org/faq.html) from the CountLove website and the opening of [this blog post](https://www.tommyleung.com/countLove/index.htm).  **(R1a)** Based on the information in these pieces, why did the creators start collecting the CountLove data?

- Next, we would like you to read this [New York Times piece that uses CountLove data](https://www.nytimes.com/interactive/2020/06/13/us/george-floyd-protests-cities-photos.html) and that describes the Black Lives Matter protests that occurred in the summer of 2020. **(R1b)** Please summarize the main point or argument of this article.

Next, we're going to reflect about who collected this data, and what's actually inside it. 

**(R1c)** Who collected and shared the CountLove data, and what do they do for a living?

**(R1d)** As Klein and D'Ignazio remind us, when it comes to data, "what gets counted counts." What types of demonstrations does CountLove include in their data, and what types do they exclude? 

**(R1e)** How and where does CountLove get their data about the protests? 

**(R1f)** How does CountLove make their estimates about the number of people who attended a protest? What potential problems might arise from this method of estimation? 

**(R1g)** What are two central values of Count Love? Name and briefly describe them. (See the Envisioning Cards for a defintion of "value".)

**(R1h)** Name and briefly describe one direct stakeholder and one indirect stakeholder (See the Envisioning Cards)? 

# 2. Coding in R: Parts 1-6
**Instructions**. Assignment instructions and prompts are in this file: [analysis.R](analysis.R).

**Coding and reflection prompts**. You will find two kinds of prompts in [analysis.R](analysis.R):

* *Coding prompts*, which prompt you to write R code in [analysis.R](analysis.R).
* *Reflection prompts*, which prompt you to think and write in English below, in this file (README.md).

**Formatting Your Responses and Reflections**.

* When formatting your written responses and reflections below, please *retain* all
reflection prompt IDs (e.g., R1a, R2a, etc.).
* Fill in the elipses (...) with your own words. 
* Remove expected word counts.
* To write clearly, use markdown code appropriately (e.g., **bold**, _italics_, and `code`). As appropriate, include images, links, and so forth.

**Questions?** As always, please post on Teams or ask your Instructor or Teaching Assistant.

:computer: Good coding!
   :writing_hand: Good critical thinking!
      :smile: Good-luck!

(_Updated: October 2022, Your Teaching Team_)

# 3. Critical Analysis & Reflection: After You Code

In the second chapter of *Data Feminism*, Klein and D'Ignazio describe 4 ways that data scientists can challenge power and take action:
> Taking action can itself take many forms, and in this chapter we offer four starting points:  
> (1) Collect: Compiling counterdata—in the face of missing data or institutional neglect—offers a powerful starting point as we see in the example of the DGEI, or in María Salguero’s femicide maps discussed in chapter 1.  
> (2) Analyze: Challenging power often requires demonstrating inequitable outcomes across groups, and new computational methods are being developed to audit opaque algorithms and hold institutions accountable.  
> (3) Imagine: We cannot only focus on inequitable outcomes, because then we will never get to the root cause of injustice. In order to truly dismantle power, we have to imagine our end point not as “fairness,” but as co-liberation.  
> (4) Teach: The identities of data scientists matter, so how might we engage and empower newcomers to the field in order to shift the demographics and cultivate the next generation of data feminists?  

**(R1h)** How does the CountLove project embody one or more of these 4 forms of challenging power? 

**(R1i)** What is the most interesting or surprising thing you learned from this analysis? Please answer in at least 2-3 sentences (2 points)

**(R1j)** What is a kind of analysis that you would like to do or that would be interesting to do with the CountLove data that you don't have the time or skills to accomplish at this moment? Please answer in at least 2-3 sentences (2 points)

## Your Responses and Reflections

### Critical Analysis & Reflection: Before You Code (questions above)

_All of the following responses have been written using information from the 3 sources linked above_

* **(R1a)** 

The creators decided to implement CountLove because they wanted to **consolidate information about protests** focusing on social justice in the US. **An important co-goal of Count Love** is to provide an avenue for the public to _develop a holistic framework_ regarding the role of protests in the grand scheme of developing a more inclusive society.

* **(R1b)** 

Police brutality inflicted **immense suffering on the black community**, resulting in the _gathering of Americans_ into an **all-out nationwide protest**. This fight is both against the racist institutions responsible for **committing violence towards the black community** and for us to **never forget the trauma** caused by racist institutions on the black community.

* **(R1c)** 

The creators, _Nathan Perkins and Tommy Leung_, are **MIT masters-graduated engineers** whose focuses are the _individual's duties to society_ ("civic responsibility") and _society's guidelines for the individual_("public policy").

* **(R1d)** 

CountLove _includes_ public protests that are specifically **not categorized under the premise of business**. CountLove _excludes_ most events **categorized under general assemblies**, such as political promotions, charity events, and historical festivities.

* **(R1e)** ... (about 25-50 words)

CountLove consolidates protest data from **internet news articles** via _"crawling"_, where categorical and numerical protest data are inputted into CountLove after "crawling" the internet for **protest-specific keywords**, which are noted and then examined. 

* **(R1f)** ... (about 25-50 words)

CountLove _underestimates_ every individual protest turnout based on the **given statistic in the crawled news article** unless the article **specifies the protest attendance** or unless the article **doesn't provide one**, in which case there is _no entered value_ for protest turnout. The _problem_ with this estimation is that the inputted value for protest attendance **may be several scales off** and thus provides the reader with an **incorrect connotation** regarding the extent of the protest.

* **(R1g)** ... (bullet points fine; about 50 words)

The CountLove FAQ mentions the fostering of **empathy** and **diversity** in society as a prospective goal. In this context, _empathy_ is the **understanding of hardships** endured by an individual or community and the subsequent willingness to **help them**; _diversity_ is the **acknowledgement and respect** given to individuals and communities of **various identities and cultures**, who can all contribute valuable thoughts and experiences.  

* **(R1h)** ... (bullet points fine; about 50 words)

A _direct stakeholder_ of CountLove is a **data scientist** who uses CountLove to determine the average turnout for BLM protests in each American city. An _indirect stakeholder_ of CountLove is **someone reading an article** with cited CountLove data that may or may not underestimate the full scale of a protest's attendance. 

### Part 3: Locations (`analysis.R`)
* **(R3a)** 

Outside of BLM, I can't remember very much about Washington's protest history. The [George Floyd Protest in Seattle Wikipedia](https://en.wikipedia.org/wiki/George_Floyd_protests_in_Seattle) goes in-depth on BLM protests in Seattle, so after reading that, I'm **surprised** Washington's protest proportion is so low, but that may also be due to _other US states potentially having more documented BLM posts_ in the CountLove dataset, in addition to _other protests fighting for different social justice causes_.

* **(R3b)** 

In all honesty, when I read this question, I wasn't expecting anything amazing, but when I saw the results, I was extremely impressed with the capabilities of this function. Just being able to parse through a vector of state names and tell me exactly how many protests occurred is an excellent example of compressing an excess amount of data into a more readable format. 

* **(R3c)** 

While the current display of data in the created table is useful because it provides us with the **total number of protests in the timespan of the data**, it is still _limited_ because we lack **quantitative nuance** beyond this, as all this data tells us is the _total number_. Adding some new code to sort through _how many protests occurred in each documented year_ as well as the _median & mean protest turnout_ would increase the quality of this data.

### Critical Analysis & Reflection: After You Code (questions above)
* **(R7h)** ... (100 words or more)
* **(R7i)** ... (50 words or more)
* **(R7j)** ... (50 words or more)
