import pandas as pd
from sqlalchemy import create_engine


conn_string = 'postgresql://postgres:admin123@localhost/ev'
db = create_engine(conn_string)
conn = db.connect()



state =  pd.read_csv('datasets/electric_vehicle_sales_by_state.csv')
maker = pd.read_csv('datasets/electric_vehicle_sales_by_makers.csv')

maker['date'] = maker['date'].astype('datetime64[ns]')
state['date'] = state['date'].astype('datetime64[ns]')

maker.to_sql('maker',con=conn,if_exists='replace',index=False)
state.to_sql('state',con=conn,if_exists='replace',index=False)
