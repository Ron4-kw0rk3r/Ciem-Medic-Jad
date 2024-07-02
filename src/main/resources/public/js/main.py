import sympy as sp
import json
import os
import sys
import time,re
def format_expression(expression):
    # Replace special characters with standard ones
    expression = expression.replace('−', '-').replace('∗', '*')
    # Remove any extra spaces
    expression = expression.replace(' ', '')
    expression = re.sub(r'(\d)([a-zA-Z])', r'\1*\2', expression)  # 2x -> 2*x
    expression = re.sub(r'([a-zA-Z])(\d)', r'\1*\2', expression)  # x2 -> x*2
    expression = re.sub(r'(\))(\()', r'\1*\2', expression)        # )( -> )*(
    expression = re.sub(r'(\d)(\()', r'\1*\2', expression)        # 2( -> 2*(
    expression = re.sub(r'(\))(\d)', r'\1*\2', expression)        # )2 -> )*2
    return expression

def validate_expression(expression):
    try:
        # Try to parse the expression to ensure it's valid
        sp.sympify(expression)
        return True
    except (sp.SympifyError, TypeError):
        return False

def simplify_expression(expression):
    expression = format_expression(expression)
    if not validate_expression(expression):
        print(f"Invalid expression: {expression}")
        return None
    x = sp.symbols('x')
    try:
        simplified_expr = sp.simplify(expression)
        simplified_expr = sp.expand(simplified_expr)  # Expand the expression to avoid fractions
        simplified_expr = simplified_expr.evalf(5)  # Round to 5 decimal places
        simplified_expr = re.sub(r'\*?\d+\.\d+[eE][+-]?\d+', '0', str(simplified_expr))  # Remove exponential notation
    except Exception as e:
        print(f"Error simplifying expression: {e}")
        return None
    return simplified_expr

def read_expression_from_file(file_path):
    with open(file_path, 'r') as file:
        expression = file.read().strip()
    print(f"Read expression: {expression}")  # Debugging line
    return expression

def write_json(simplified_result, output_file):
    result_json = json.dumps({ "value": str(simplified_result)})
    with open(output_file, 'w') as json_file:
        json_file.write(result_json)

def write_output_txt(simplified_result, output_file):
    with open(output_file, 'w') as txt_file:
        txt_file.write(str(simplified_result))

if __name__ == "__main__":
    if len(sys.argv) == 2:
        file_path = sys.argv[1]
        output_dir = r'C:\\Users\\Ronald\\Documents\\INGENIERIA DE SISTEMAS\\proyectoIntegral\\Ciem-Medic-Jad\\src\\main\\resources\\public\\js'
        output_json_file = os.path.join(output_dir, 'simplified_result.json')
        output_txt_file = os.path.join(output_dir, 'output.txt')

        if not os.path.exists(output_dir):
            os.makedirs(output_dir)

        last_modified_time = None

        while True:
            for _ in range(5):
                current_modified_time = os.path.getmtime(file_path)
                if last_modified_time is None or current_modified_time != last_modified_time:
                    last_modified_time = current_modified_time
                    expression = read_expression_from_file(file_path)
                    simplified_result = simplify_expression(expression)
                    if simplified_result is not None:
                        write_json(simplified_result, output_json_file)
                        write_output_txt(simplified_result, output_txt_file)
                        print({simplified_result})
                else:
                    print("No changes detected.")
                time.sleep(1)  # Check for file changes every 2 seconds
    else:
        print("Usage: python main.py <path_to_expression_file>")