import streamlit as st
from connect_dw import query_job_listings
from wordcloud import WordCloud
import matplotlib.pyplot as plt
import pandas as pd


def layout():
    df = query_job_listings()

    st.title("Health care job ads")
    st.write(
        "This dashboard shows health care related job ads from Swedish Public Employment Service's API. "
    )

    # Total number of vacancies and vacancies per city
    st.markdown("## Vacancies")
    cols = st.columns(4)

    with cols[0]:
        st.metric(label="Total", value=df["VACANCIES"].sum())

    with cols[1]:
        st.metric(
            label="In Stockholm",
            value=df.query("WORKPLACE_CITY == 'Stockholm'")["VACANCIES"].sum(),
        )
     
    with cols[2]:
        st.metric(
            label="In Göteborg",
            value=df.query("WORKPLACE_CITY == 'Göteborg'")["VACANCIES"].sum(),
        )

    with cols[3]:
        st.metric(
            label="In Malmö",
            value=df.query("WORKPLACE_CITY == 'Malmö'")["VACANCIES"].sum(),
        )
 
    cols = st.columns(2)

    with cols[0]:
        st.markdown("### Per city")
        st.dataframe(
            query_job_listings(
                """
                    SELECT 
                        SUM(vacancies) as vacancies,
                        workplace_city
                    FROM 
                        mart_job_listings
                    GROUP BY 
                        workplace_city
                    ORDER BY vacancies DESC;
                    """
            )
        )
    with cols[1]:
        st.markdown("### Per company (top 5)")
        st.bar_chart(
            query_job_listings(
                """
                    SELECT 
                        SUM(vacancies) as vacancies,
                        employer_name
                    FROM 
                        mart_job_listings
                    GROUP BY 
                        employer_name
                    ORDER BY vacancies DESC LIMIT 5;
                    """
            ),
            x="EMPLOYER_NAME",
            y="VACANCIES",
        )

    st.markdown("## Vacancies per region")
    cols = st.columns(1)

    with cols[0]:
        st.bar_chart(
            query_job_listings(
                """
                    SELECT 
                        SUM(vacancies) as vacancies,
                        workplace_region
                    FROM 
                        mart_job_listings
                    GROUP BY 
                        workplace_region
                    ORDER BY vacancies DESC;
                    """
            ),
            x="WORKPLACE_REGION",
            y="VACANCIES",
        )

    st.markdown("## Employment duration")
    cols = st.columns(1)
    
    # donut chart for salary type
    with cols[0]:
        fig, ax = plt.subplots(figsize=(5, 5))
        df["DURATION"].value_counts().plot.pie(autopct="%1.0f%%", 
                                                  textprops={"color": "w", "fontsize": 14})
        fig.patch.set_alpha(0)  # Transparent background for the figure
        ax.set_facecolor('grey')
        plt.axis("equal")
        st.pyplot(fig)

    st.markdown("## Find advertisement")

    cols = st.columns(2)
    with cols[0]:
        selected_company = st.selectbox(
            "Select a company:", df["EMPLOYER_NAME"].unique()
        )

    with cols[1]:
        selected_headline = st.selectbox(
            "Select an advertisement:",
            df.query("EMPLOYER_NAME == @selected_company")["HEADLINE"],
        )

    st.markdown("### Job ad")
    st.markdown(
        df.query(
            "HEADLINE == @selected_headline and EMPLOYER_NAME == @selected_company"
        )["DESCRIPTION_HTML_FORMATTED"].values[0],
        unsafe_allow_html=True,
    )

    # Word cloud
    st.markdown("## Most used words in job ads")
    st.write("This word cloud shows the most used words in the job ads. Choose topic to see the word cloud for headlines or descriptions.")


    topic = st.selectbox('Select topic',['Headline', 'Job description'])
    if topic == 'Headline':
        content = pd.DataFrame(df["HEADLINE"])
    else:
        content = pd.DataFrame(df["DESCRIPTION"])


    wordcloud = WordCloud(stopwords={'till', 'för', 'som', 'i', 'på', 'och', 
                                     'med', 'n', 'en', 'ett', 'r', 'av', 'eller',
                                     'att', 'den', 'det'},
                          width=1000, height=500).generate_from_text(content.to_string())

    # Display wordcloud
    fig, ax = plt.subplots(figsize = (20, 10), facecolor ='k')
    ax.imshow(wordcloud)
    plt.axis("off")
    plt.tight_layout(pad=0)
    st.pyplot(fig)

    # Show the data4
    st.markdown("## Job listings data")
    st.dataframe(df)


if __name__ == "__main__":
    layout()