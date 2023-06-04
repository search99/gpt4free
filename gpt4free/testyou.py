import  you

# simple request with links and details
response = you.Completion.create(
    # prompt="hello world",
    prompt="介绍一下杭州，请给出中文回答。",
    detailed=True,
    include_links=True, )

print(response.text.encode('utf-8').decode('unicode_escape'))