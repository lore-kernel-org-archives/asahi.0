Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E82E2FB624
	for <asahi@lists.linux.dev>; Fri, 14 Nov 2025 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120220; cv=none; b=Tcnzwon8sKhj/AfLmqZLZu8eCSzVxk9o6Dt+HmjsrMdaQgbzxCrlc5NdsaxC3j0qKgAshQQ7usiYgYZkJ3ZpdFcoJnipchsY3x6hS1LreNnWsvCD9pumxHXUaJ/YhiTl50BlZiAenRUGdPRi+H2ia4EjigYoazGBwQm8KDZggKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120220; c=relaxed/simple;
	bh=YOqQYfs4nuQmvSgoRMMjC8XlPFHhX1Q2biOJY+6ams8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UkSfkgUPvGmgMgg49ol0VtlJPRQzF4R9a/11MalSaNb3+6mVBjEsqi0GIYeTMLL8pMK9X1ETTZnHVmo7F1LHLKqxdv/J8jxFmhf0lF3X7orgXlvdcfp5fTT4kzHmcMNM3VJxIbrUkQUohT1/ARmY7YE46a3BrznZEureCOue8cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cr/RH+V+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cr/RH+V+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763120217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9P5NBgI6mcvaRko/BuipRaZLnCkAOoZG9QxXhEGpNPI=;
	b=Cr/RH+V+5Wd5XNdL1ASEGglGkclKI/rY/nZaYmCDMp+nC6AmOVyxO0kADAsGcw0qoWoxRd
	xHmBow08gRVtdPhbCBPTU20KLdeT8Y62DhI3m4GKcdpwoJ61tPHwgyHx9/sOhYFOFbcoBd
	GQ6Wgx4uJTiok9w8FyB00fACnAr0Cj8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-Fq6_sgE9P-ykp6dKLqyyFg-1; Fri, 14 Nov 2025 06:36:56 -0500
X-MC-Unique: Fq6_sgE9P-ykp6dKLqyyFg-1
X-Mimecast-MFC-AGG-ID: Fq6_sgE9P-ykp6dKLqyyFg_1763120215
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b73405a2e7bso167913666b.0
        for <asahi@lists.linux.dev>; Fri, 14 Nov 2025 03:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120215; x=1763725015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9P5NBgI6mcvaRko/BuipRaZLnCkAOoZG9QxXhEGpNPI=;
        b=ZIiHByTGbwZ834w2K0VBEec5FmmL2NASPVAVR7uU1xO5VeB2x9rwLpgSO2jX2oaP8M
         BkRAxr709u1X2I+EX4eD7B8xotF2EnF32NWSBE+g7Nm9ZIFXrBL8rRafmMz0DZCSIPtT
         pvWRR0yY6vT/7VvKvK9ZrtATZfhpIKV5yOcNtGyKNVId995/oKUZQ1HktHzMJkkO5S4T
         V2Z0l9ajkULlpd2KGXhJqPuc12oLCqlQwi2fsK7+i7UG/7CCmrjWNf1l3poIGBQx+SdL
         NMbwhYS8djsZLrJa+XFPrGFLagomR3m/katfZWqqpVu4Hsq2+mBZ3Lp54VZATlsdEc04
         IsFA==
X-Forwarded-Encrypted: i=1; AJvYcCXR7HuyyrQEyme2lFHmZ/y2xCPxrfgg0VMbFF6Ap5H3YRmT8UgMp0dRrgMYKRl4iGyyA7h1kA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDZoQWuoAEtBFlpHma46ucvevNTiSEwPUV4kWV+xm4iBHvZls9
	8UQ52Fzd/2nelHqAY55OBWyNDPk9J/UJGJPE4SI0fjoz2LagXCaW8N0sqYGq7gTEZjhnczn62ps
	tFG/aD1iIE19a3zZSI8VOwqKb9nVysU91DCab9fg9oQgmnDxparRByHaa
X-Gm-Gg: ASbGncskp45FFZT0sSZ4nUxNqB6BkqizMBJyhLAHGJXecWx4PkKP+SF3XKGjR74gKNG
	T6yP+jG60B0F21JDG3411LC/dd3ZzROEmCl7bcjGFAHFb94kBegdDjVOevXDyPmgG3s0IDA3JjD
	owv/VQjCCM3T2M8jepLJPQ0nKYL0LJhXSh3woBZxxgRqqkQkkgdz4ptXYj218elDXC68NZoxy+L
	WFEIG4P6/r1Jqk/OtikaYlJXokhfJyMExhy+j9yzVphLKZ0bxnZWkqoler3IOXRYX7iFKhgespe
	J/G6ZNKwDlg1J3oiZj3Qn6IzGCX8CUlObTUQyx/1eTXmxpXNUQO4gUZGDcc5j9uh6JB4CJXrg0k
	i06Eq6ApWzhbM95mhJLBxAIten8GfpvTp5KKWo8kHypxz4HC4
X-Received: by 2002:a17:907:3f0a:b0:b71:b4a1:b29d with SMTP id a640c23a62f3a-b736796a40amr241980266b.64.1763120214725;
        Fri, 14 Nov 2025 03:36:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGncWVaDUYmrZnQ3gSDBk8EIFCOicAB84qOiU3rPLLBv82jXFCsdviDxrNodVDC2Ot4XM+Oyw==
X-Received: by 2002:a17:907:3f0a:b0:b71:b4a1:b29d with SMTP id a640c23a62f3a-b736796a40amr241977566b.64.1763120214298;
        Fri, 14 Nov 2025 03:36:54 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad41d9sm371942366b.27.2025.11.14.03.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:36:53 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Frank Li <Frank.Li@nxp.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Peter Rosin <peda@axentia.se>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	asahi@lists.linux.dev,
	patches@opensource.cirrus.com
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: refer to trivial-codec.yaml in relevant sections
Date: Fri, 14 Nov 2025 12:36:41 +0100
Message-ID: <20251114113647.231481-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3xyNVPwVnfDKG5QwtRy8kQ15ot4Jk_5SGhFn8es9O-s_1763120215
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 4acbfcf11cbe ("ASoC: dt-bindings: consolidate simple audio codec to
trivial-codec.yaml") aggregates a few sound device-tree bindings, i.e., txt
and yaml files, into a common trivial-codec.yaml, but misses to adjust the
references in ANALOG DEVICES INC ASOC CODEC DRIVERS, ARM/APPLE MACHINE
SOUND DRIVERS, NXP TFA9879 DRIVER and WOLFSON MICROELECTRONICS DRIVERS,
which refer to files removed by the commit above.

Make these sections refer to trivial-codec.yaml, in order to inform the
maintainers on changes to the device-tree binding relevant to the
hardware drivers.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 836ec73c604d..311c418a76ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1770,6 +1770,7 @@ S:	Supported
 W:	http://wiki.analog.com/
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/sound/adi,*
+F:	Documentation/devicetree/bindings/sound/trivial-codec.yaml
 F:	sound/soc/codecs/ad1*
 F:	sound/soc/codecs/ad7*
 F:	sound/soc/codecs/adau*
@@ -2419,9 +2420,9 @@ M:	Martin Povišer <povik+lin@cutebit.org>
 L:	asahi@lists.linux.dev
 L:	linux-sound@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
-F:	Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
 F:	Documentation/devicetree/bindings/sound/apple,*
+F:	Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+F:	Documentation/devicetree/bindings/sound/trivial-codec.yaml
 F:	sound/soc/apple/*
 F:	sound/soc/codecs/cs42l83-i2c.c
 F:	sound/soc/codecs/cs42l84.*
@@ -18843,7 +18844,7 @@ NXP TFA9879 DRIVER
 M:	Peter Rosin <peda@axentia.se>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
+F:	Documentation/devicetree/bindings/sound/trivial-codec.yaml
 F:	sound/soc/codecs/tfa9879*
 
 NXP-NCI NFC DRIVER
@@ -27915,6 +27916,7 @@ F:	Documentation/devicetree/bindings/extcon/wlf,arizona.yaml
 F:	Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
 F:	Documentation/devicetree/bindings/mfd/wm831x.txt
 F:	Documentation/devicetree/bindings/regulator/wlf,arizona.yaml
+F:	Documentation/devicetree/bindings/sound/trivial-codec.yaml
 F:	Documentation/devicetree/bindings/sound/wlf,*.yaml
 F:	Documentation/devicetree/bindings/sound/wm*
 F:	Documentation/hwmon/wm83??.rst
-- 
2.51.1

