# -*- makefile -*-

JUCE_TARGET_LV2 := Tunefish4.so
JUCE_OUTDIR_LV2 := $(JUCE_OUTDIR)/Tunefish4.lv2
JUCE_CFLAGS_LV2 := $(JUCE_CFLAGS_VST)
JUCE_CPPFLAGS_LV2 := $(JUCE_CPPFLAGS_VST)
JUCE_LDFLAGS_LV2 := $(JUCE_LDFLAGS_VST)

all : LV2
LV2 : $(JUCE_OUTDIR_LV2)/$(JUCE_TARGET_LV2)

OBJECTS_LV2 := \
  $(JUCE_OBJDIR)/include_juce_audio_plugin_client_LV2_.o

$(JUCE_OBJDIR)/include_juce_audio_plugin_client_LV2_.o: ../../JuceLibraryCode/include_juce_audio_plugin_client_LV2.cpp
	-$(V_AT)mkdir -p $(JUCE_OBJDIR)
	@echo "Compiling include_juce_audio_plugin_client_LV2.cpp"
	$(V_AT)$(CXX) $(JUCE_CXXFLAGS) $(JUCE_CPPFLAGS_LV2) $(JUCE_CFLAGS_LV2) -o "$@" -c "$<"

$(JUCE_OUTDIR_LV2)/$(JUCE_TARGET_LV2) : $(OBJECTS_LV2) $(RESOURCES) $(JUCE_OUTDIR)/$(JUCE_TARGET_SHARED_CODE)
	@echo Linking "Tunefish4 - LV2"
	-$(V_AT)mkdir -p $(JUCE_BINDIR)
	-$(V_AT)mkdir -p $(JUCE_LIBDIR)
	-$(V_AT)mkdir -p $(JUCE_OUTDIR_LV2)
	$(V_AT)$(CXX) -o $(JUCE_OUTDIR_LV2)/$(JUCE_TARGET_LV2) $(OBJECTS_LV2) $(JUCE_OUTDIR)/$(JUCE_TARGET_SHARED_CODE) $(JUCE_LDFLAGS) $(JUCE_LDFLAGS_LV2) $(RESOURCES) $(TARGET_ARCH)
	../../generate-lv2-ttl.py $(JUCE_OUTDIR_LV2)/$(JUCE_TARGET_LV2)

-include $(OBJECTS_LV2:%.o=%.d)
