{% if phrases is defined %}
    <form method="post" action="" class="ui form segment" enctype="application/x-www-form-urlencoded">
        <div class="field">
            <input type="submit" class="ui button positive" value="Сохранить">
			<button type="button" class="ui button blue" onclick="fillEmpties();">Проставить пустые ячейки исходными значениями</button>
        </div>
        <table class="ui table very compact celled">
            <thead>
            <tr>
                <th style="text-align: right; width: 25%;">Исходник</th>
                <th>Перевод</th>
            </tr>
            </thead>
            <tbody>
            {% for phrase in phrases %}
                <tr>
                    <td style="text-align: right;">
                        {{ phrase }}
                    </td>
                    <td class="ui input small">
                        {% set translation = model.findByPhraseAndLang(phrase) %}
                        <input type="text" name="{{ phrase|escape }}" value="{% if translation %}{{ translation.getTranslation()|escape }}{% endif %}">
                    </td>
                </tr>
            {% endfor %}
            </tbody>
        </table>
        <div class="field">
            <input type="submit" class="ui button positive" value="Сохранить">
        </div>
    </form>
{% else %}
    <div class="ui blue inverted segment">Исходники переводов не обнарежены</div>
{% endif %}

<script>
    function fillEmpties()
    {
        $("input[type='text']").each(function(index, object){
            var input = $(object);
            if (!input.val()) {
                input.val(input.attr('name'));
            }
        });
    }
</script>
