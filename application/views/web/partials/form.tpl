{if isset($form.fields) and isset($form.arangement) and is_array($form.fields) and is_array($form.arangement)}
{foreach $form.arangement as $index}
    {$form_element = 0}{if isset($form.fields[$index]) and is_array($form.fields[$index])}{$form_element = $form.fields[$index]}{/if}
    {if $form_element neq 0}
        {if $form_element.type eq 'text_input'}
            {include file='web/forms/input.tpl' form_element=$form_element form_source=$source inline}
        {elseif $form_element.type eq 'password_input'}
            {include file='web/forms/input.tpl' form_element=$form_element form_source=$source inline}
        {elseif $form_element.type eq 'select'}
            {include file='web/forms/select.tpl' form_element=$form_element form_source=$source inline}
        {elseif $form_element.type eq 'flipswitch'}
            {include file='web/forms/flipswitch.tpl' form_element=$form_element form_source=$source inline}
        {/if}
    {else}
        <p>Chyba, nedá da nájsť index {$index}.</p>
    {/if}
{/foreach}
{/if}