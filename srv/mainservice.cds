using { po.ust as ust } from '../db/schema';

service MainService{

    entity mastermaterial as projection on ust.mastermaterial;
    entity vendormaster as projection on ust.vendormaster;

    entity poheader as projection on ust.poheader;
    entity poitem as projection on ust.poitem;

    entity inv_header as projection on ust.inv_header;
    entity inv_item as projection on ust.inv_item;

    entity gr_header as projection on ust.gr_header;
    entity gr_item as projection on ust.gr_item;
}