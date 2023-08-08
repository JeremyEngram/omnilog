import os
import datetime
from fpdf import FPDF

# Directory containing the logs
logs_directory = '/path/to/logs'

# Report name
report_name = 'Sample Report'

# Get the current date
current_date = datetime.datetime.now().strftime('%Y-%m-%d')

# Create a PDF object
pdf = FPDF()
pdf.set_auto_page_break(auto=True, margin=15)
pdf.add_page()
pdf.set_font("Arial", size=12)
pdf.cell(0, 10, f"Report: {report_name}", ln=True, align='C')
pdf.cell(0, 10, f"Date: {current_date}", ln=True, align='C')
pdf.ln()

# Process each log file
for filename in os.listdir(logs_directory):
    if filename.endswith('.log'):
        log_path = os.path.join(logs_directory, filename)

        # Read the log file
        with open(log_path, 'r') as log_file:
            log_content = log_file.read()

        # Perform summarization or analysis logic here
        # Modify the following lines to suit your specific requirements
        # ...

        # Add the log summary to the PDF
        pdf.cell(0, 10, f"Log file: {filename}", ln=True, align='L')
        pdf.multi_cell(0, 10, f"Summary: {log_content}", align='L')
        pdf.ln()

# Create the output directory if it doesn't exist
output_directory = '/var/log/forensics/reporting'
os.makedirs(output_directory, exist_ok=True)

# Generate the report file name
report_file_name = f"{report_name}_{current_date}.pdf"
report_file_path = os.path.join(output_directory, report_file_name)

# Save the PDF report
pdf.output(report_file_path)

print(f"Report generated successfully: {report_file_path}")
