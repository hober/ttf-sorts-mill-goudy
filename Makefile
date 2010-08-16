ROOT=ttf-sorts-mill-goudy

FONTS=$(ROOT)/OFLGoudyStM.otf $(ROOT)/OFLGoudyStM-Italic.otf
DOCS=$(ROOT)/OFL.txt $(ROOT)/OFL-FAQ.txt $(ROOT)/FONTLOG

ttf-sorts-mill-goudy_001.000-1_all.deb: $(FONTS) $(DOCS)
	cd $(ROOT) && debuild -us -uc

$(FONTS) $(DOCS): $(ROOT)/sorts-mill-goudy.zip
	cd $(ROOT) && unzip -j sorts-mill-goudy.zip $(@F)

$(ROOT)/sorts-mill-goudy.zip:
	cd $(ROOT) && curl -O http://s3.amazonaws.com/theleague-production/fonts/sorts-mill-goudy.zip

install: ttf-sorts-mill-goudy_001.000-1_all.deb
	dpkg -i ttf-sorts-mill-goudy_001.000-1_all.deb

clean:
	rm -f ttf-sorts-mill-goudy_001.* *~
	rm -f $(FONTS) $(DOCS) $(ROOT)/sorts-mill-goudy.zip
	cd $(ROOT)/debian && rm -rf ttf-sorts-mill-goudy.debhelper.log ttf-sorts-mill-goudy.substvars ttf-sorts-mill-goudy/
