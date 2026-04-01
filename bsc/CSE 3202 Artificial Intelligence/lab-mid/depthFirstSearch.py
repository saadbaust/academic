# This is a graph:
graph = {
    '5': ['3', '7'],
    '3': ['2', '4'],
    '7': ['8'],
    '2': [],
    '8': [],
    '4': ['8']
}
# Declaring lists:
visited = []
stack = []
# Initializing lists with root:
visited.append('5')
stack.append('5')
# Calculating shortest path using DFS:
print("Shortest path using Depth First Search:")
while stack:
    m = stack.pop()
    print(m, end="-")
    for x in graph[m]:
        if x not in visited:
            visited.append(x)
            stack.append(x)
print("All visited")
# Code ends here: