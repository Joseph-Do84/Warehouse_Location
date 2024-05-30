# Warehouse Location Problem

An online retail company in the US is planning to open warehouses in potential locations to optimize their logistics and service delivery. This project aims to solve the warehouse location problem using mathematical modeling and optimization techniques.

## Problem Description

The company is considering opening warehouses in the following cities: Chicago, Atlanta, New York, St. Louis, Detroit, Cincinnati, Pittsburgh, Charlotte, and Boston. The goal is to minimize the total weighted distance between demand points and their nearest warehouse while considering budgetary constraints and service level requirements.

### Data

**Distance Matrix (in miles):**

| City        | Chicago | Atlanta | New York | St. Louis | Detroit | Cincinnati | Pittsburgh | Charlotte | Boston |
|-------------|---------|---------|----------|-----------|---------|------------|------------|-----------|--------|
| Chicago     | 0       | 720     | 790      | 297       | 283     | 296        | 461        | 769       | 996    |
| Atlanta     | 720     | 0       | 884      | 555       | 722     | 461        | 685        | 245       | 1099   |
| New York    | 790     | 884     | 0        | 976       | 614     | 667        | 371        | 645       | 219    |
| St. Louis   | 297     | 555     | 976      | 0         | 531     | 359        | 602        | 715       | 1217   |
| Detroit     | 283     | 722     | 614      | 531       | 0       | 263        | 286        | 629       | 721    |
| Cincinnati  | 296     | 461     | 667      | 359       | 263     | 0          | 288        | 479       | 907    |
| Pittsburgh  | 461     | 685     | 371      | 602       | 286     | 288        | 0          | 448       | 589    |
| Charlotte   | 769     | 245     | 645      | 715       | 629     | 479        | 448        | 0         | 867    |
| Boston      | 996     | 1099    | 219      | 1217      | 721     | 907        | 589        | 867       | 0      |

**Demand at each location:**

| City       | Demand   |
|------------|----------|
| Chicago    | 2,870,000 |
| Atlanta    | 572,000   |
| New York   | 8,450,000 |
| St. Louis  | 350,000   |
| Detroit    | 901,000   |
| Cincinnati | 333,000   |
| Pittsburgh | 306,000   |
| Charlotte  | 723,000   |
| Boston     | 610,000   |

## Objectives

1. **Minimize Total Weighted Distance**: The objective is to minimize the total weighted distance between demand points and their nearest warehouse, with weight being the demand of each location. The company can open only \( p \) warehouses due to budgetary limitations.

2. **Maximize Service Distance**: Ensure that no demand location is more than 500 miles away from a warehouse and maximize the total demand that can be covered within a 200-mile distance (high service distance).

## Mathematical Model

**Variables:**
- \( x_{ij} \): Binary variable indicating whether a warehouse is placed in city \( i \) to serve city \( j \).
- \( y_i \): Binary variable indicating whether a warehouse is opened in city \( i \).

**Parameters:**
- \( d_{ij} \): Distance between city \( i \) and city \( j \).
- \( w_j \): Demand at city \( j \).
- \( p \): Number of warehouses to be opened.
- \( D_{\text{max}} \): Maximum distance a demand point can be from a warehouse.
- \( D_{\text{service}} \): High service distance.

**Objective Function:**
- Minimize total weighted distance: \( \sum_{i} \sum_{j} d_{ij} \cdot w_j \cdot x_{ij} \).

**Constraints:**
1. Each demand point must be assigned to exactly one warehouse:
   \( \sum_{i} x_{ij} = 1 \quad \forall j \).

2. A warehouse must be open in city \( i \) if it serves any city \( j \):
   \( x_{ij} \leq y_i \quad \forall i, j \).

3. The total number of warehouses must be exactly \( p \):
   \( \sum_{i} y_i = p \).

4. Maximum distance constraint: 
   \( d_{ij} \cdot x_{ij} \leq D_{\text{max}} \quad \forall i, j \).

5. High service distance constraint:
   \( \sum_{i} \sum_{j: d_{ij} \leq D_{\text{service}}} w_j \cdot x_{ij} \).

## Files

- `warehouse_location.mod`: The OPL model file.
- `warehouse_location.dat`: The data file containing distance matrix and demand values.


