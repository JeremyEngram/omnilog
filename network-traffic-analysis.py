def analyze_network_traffic(log_file):
    network_traffic = []
    with open(log_file, 'r') as file:
        for line in file:
            if 'network_traffic' in line:
                network_traffic.append(line)
    return network_traffic

def summarize_network_traffic(network_traffic):
    summary = f"Total network traffic events: {len(network_traffic)}\n"
    summary += "Top sources with most traffic:\n"
    source_counts = {}
    for event in network_traffic:
        source = extract_source_ip(event)
        source_counts[source] = source_counts.get(source, 0) + 1
    sorted_sources = sorted(source_counts, key=source_counts.get, reverse=True)
    for source in sorted_sources[:5]:
        summary += f"Source IP: {source}, Count: {source_counts[source]}\n"
    return summary

def extract_source_ip(network_event):
    # Perform source IP extraction logic based on log event format
    pass

# Usage example:
log_file = 'network.log'
network_traffic = analyze_network_traffic(log_file)
summary = summarize_network_traffic(network_traffic)
print(summary)
