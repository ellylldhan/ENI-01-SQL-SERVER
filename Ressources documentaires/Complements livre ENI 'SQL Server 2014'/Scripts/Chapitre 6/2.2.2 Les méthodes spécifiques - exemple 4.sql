
declare @test xml;
set @test='<page datecreation="26062014">
              <article>
                <reference>SONYMP3</reference>
                <designation>Lecteur MP3</designation>
                <prixttc>66.90</prixttc>
              </article>
              <article>
                <reference>LPYO</reference>
                <designation>Lecteur MP3, blanc</designation>
                <prixttc>45.50</prixttc>
              </article>
              <numero>1</numero>
            </page>';

select resultats.x.query('.') from @test.nodes('/page/article') as resultats(x);