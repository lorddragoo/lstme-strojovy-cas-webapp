{extends file='web/layouts/admin.tpl'}
{block content_block}
    <div class="ui-body ui-body-c ui-corner-all">
        {if $products->exists()}
        <table data-role="table" data-mode="reflow" class="admin_grid_table ui-responsive"
               data-gridtable-operations="edit:Upraviť,delete:Vymazať,stock:Sklad"
               data-gridtable-operation-edit-url="{'products/edit_product/--ID--'|site_url}"
               data-gridtable-operation-delete-prompt="true"
               data-gridtable-operation-delete-prompt-title="Vymazať produkt?"
               data-gridtable-operation-delete-prompt-text="Naozaj chcete vymazať produkt --TITLE--?"
               data-gridtable-operation-delete-prompt-cancel="Nie, nechcem"
               data-gridtable-operation-delete-prompt-ok="Áno, chcem"
               data-gridtable-operation-delete-prompt-ok-url="{'products/delete_product/--ID--'|site_url}"
               data-gridtable-operation-stock-url="{'products/stock/--ID--'|site_url}"
        >
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Názov</th>
                    <th>Cena</th>
                    <th>Zostatok skladom</th>
                </tr>
            </thead>
            <tbody>
                {foreach $products as $product}
                <tr data-gridtable-unique="product_{$product->id|intval}" data-gridtable-id="{$product->id|intval}" data-gridtable-title="{$product->title|escape:'html'|addslashes}">
                    <td>{$product->id|intval}</td>
                    <td>{$product->title}</td>
                    <td>{include file='web/partials/minutes_inflection.tpl' minutes=$product->price inline}</td>
                    <td>{include file='web/partials/pieces_inflection.tpl' pieces={$product->plus_quantity - $product->minus_quantity}|intval inline}</td>
                </tr>
                {/foreach}
            </tbody>
        </table>
        {else}
            Momentálne nie sú v systéme žiadne produkty.
        {/if}
    </div>
{/block}
{block header_block}
<script type="text/javascript">
$(document).ready(function(){
    make_gridtable_active('table.admin_grid_table');
    window.location = '#';
});
</script>
{/block}