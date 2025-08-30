import ldif
import yaml

parser = ldif.LDIFParser(open("subschema.ldif", "rb"))
for dn, record in parser.parse():
    # import pdb; pdb.set_trace()
    # print(yaml.dump(record))
    for object_class in record["objectClasses"]:
        import pdb; pdb.set_trace()
        print(object_class)
