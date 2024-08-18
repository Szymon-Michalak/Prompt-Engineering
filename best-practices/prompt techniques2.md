# Best Practices for Prompt Engineering with the OpenAI API

## How Prompt Engineering Works
OpenAI models are trained in a way that certain prompt formats work particularly well, leading to more useful and relevant outputs. Adhering to specific prompt engineering guidelines can significantly improve the quality of responses from these models.

### General Guidelines
While there is a range of prompt formats that work effectively, the following best practices are recommended for optimizing interactions with OpenAI models.

## Key Best Practices and Techniques

### 1. Use the Latest Model
- **Principle**: For best results, use the latest and most capable models available. Newer models tend to be easier to prompt engineer and generally produce better outputs.
- **Example**: Always check for the most recent model version when starting a new project.

### 2. Put Instructions at the Beginning of the Prompt
- **Principle**: Start your prompt with clear instructions and use `###` or `"""` to separate these instructions from the input context.
- **Less Effective** ❌:
  ```
  Summarize the text below as a bullet point list of the most important points.
  
  {text input here}
  ```
- **Better** ✅:
  ```
  Summarize the text below as a bullet point list of the most important points.
  
  Text: """
  {text input here}
  """
  ```

### 3. Be Specific, Descriptive, and Detailed
- **Principle**: Clearly articulate the desired context, outcome, length, format, style, and other details.
- **Less Effective** ❌:
  ```
  Write a poem about OpenAI.
  ```
- **Better** ✅:
  ```
  Write a short inspiring poem about OpenAI, focusing on the recent DALL-E product launch (DALL-E is a text to image ML model) in the style of a {famous poet}.
  ```

### 4. Articulate the Desired Output Format Through Examples
- **Principle**: Provide specific examples of the desired output format to guide the model effectively.
- **Less Effective** ❌:
  ```
  Extract the entities mentioned in the text below. Extract the following 4 entity types: company names, people names, specific topics, and themes.
  
  Text: {text}
  ```
- **Better** ✅:
  ```
  Extract the important entities mentioned in the text below. First extract all company names, then extract all people names, then extract specific topics which fit the content, and finally extract general overarching themes.
  
  Desired format:
  Company names: <comma_separated_list_of_company_names>
  People names: <comma_separated_list_of_people_names>
  Specific topics: <comma_separated_list_of_specific_topics>
  General themes: <comma_separated_list_of_general_themes>
  
  Text: {text}
  ```

### 5. Start with Zero-Shot, Then Few-Shot, Then Fine-Tuning if Necessary
- **Principle**: Begin with zero-shot prompts and progress to few-shot if needed. If neither approach works, consider fine-tuning the model.
- **Zero-Shot** ✅:
  ```
  Extract keywords from the below text.
  
  Text: {text}
  
  Keywords:
  ```
- **Few-Shot** ✅:
  ```
  Extract keywords from the corresponding texts below.
  
  Text 1: Stripe provides APIs that web developers can use to integrate payment processing into their websites and mobile applications.
  Keywords 1: Stripe, payment processing, APIs, web developers, websites, mobile applications
  ##
  Text 2: OpenAI has trained cutting-edge language models that are very good at understanding and generating text. Our API provides access to these models and can be used to solve virtually any task that involves processing language.
  Keywords 2: OpenAI, language models, text processing, API.
  ##
  Text 3: {text}
  Keywords 3:
  ```
- **Fine-Tuning** ✅: See OpenAI’s fine-tuning best practices for more detailed guidance.

### 6. Reduce “Fluffy” and Imprecise Descriptions
- **Principle**: Avoid vague and imprecise language. Be clear and specific in your instructions.
- **Less Effective** ❌:
  ```
  The description for this product should be fairly short, a few sentences only, and not too much more.
  ```
- **Better** ✅:
  ```
  Use a 3 to 5 sentence paragraph to describe this product.
  ```

### 7. Provide Alternatives Instead of Just Prohibitions
- **Principle**: Instead of merely stating what not to do, guide the model by providing alternatives and clear instructions on what to do.
- **Less Effective** ❌:
  ```
  The following is a conversation between an Agent and a Customer. DO NOT ASK USERNAME OR PASSWORD. DO NOT REPEAT.
  
  Customer: I can’t log in to my account.
  Agent:
  ```
- **Better** ✅:
  ```
  The following is a conversation between an Agent and a Customer. The agent will attempt to diagnose the problem and suggest a solution, whilst refraining from asking any questions related to PII. Instead of asking for PII, such as username or password, refer the user to the help article www.samplewebsite.com/help/faq.
  
  Customer: I can’t log in to my account.
  Agent:
  ```

### 8. Code Generation Specific: Use “Leading Words” to Nudge the Model
- **Principle**: Use leading words or phrases to nudge the model toward generating the desired type of code.
- **Less Effective** ❌:
  ```
  # Write a simple python function that
  # 1. Ask me for a number in mile
  # 2. It converts miles to kilometers
  ```
- **Better** ✅:
  ```
  # Write a simple python function that
  # 1. Ask me for a number in mile
  # 2. It converts miles to kilometers
  
  import
  ```

## Understanding Parameters

### Model
- **Principle**: Higher performance models are generally more expensive and may have higher latency. Choose the model that best fits your needs.

### Temperature
- **Principle**: Controls the randomness of the model’s output. A higher temperature value results in more creative and varied responses, while a lower value produces more deterministic and accurate outputs.
- **Usage**: For factual tasks, use a temperature close to 0.

### Max Tokens
- **Principle**: This parameter sets a hard limit on the number of tokens generated by the model. It does not control the output length but stops generation when the limit is reached.
- **Usage**: Ensure your prompts are designed to avoid hitting this limit, or define a stop sequence.

### Stop Sequences
- **Principle**: A set of tokens that, when encountered, will stop the text generation. This is useful for preventing the model from generating unnecessary or irrelevant content.
- **Usage**: Set specific stop sequences based on the format or structure of your expected output.

For more detailed descriptions and additional parameters, refer to the OpenAI API reference.

## Conclusion
By following these best practices for prompt engineering, you can significantly improve the quality of the outputs generated by OpenAI models. These guidelines not only help in crafting clear and effective prompts but also in understanding how to manipulate model parameters to achieve the desired outcomes.
