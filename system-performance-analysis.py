def analyze_system_performance(log_file):
    system_metrics = []
    with open(log_file, 'r') as file:
        for line in file:
            if 'system_performance' in line:
                system_metrics.append(line)
    return system_metrics

def analyze_system_events(log_file):
    system_events = []
    with open(log_file, 'r') as file:
        for line in file:
            if 'system_event' in line:
                system_events.append(line)
    return system_events

def summarize_system_performance(system_metrics, system_events):
    # Perform analysis and correlation logic based on system metrics and events
    summary = "System Performance Summary:\n"
    # ...
    return summary

# Usage example:
metrics_file = 'performance.log'
events_file = 'events.log'
system_metrics = analyze_system_performance(metrics_file)
system_events = analyze_system_events(events_file)
summary = summarize_system_performance(system_metrics, system_events)
print(summary)
