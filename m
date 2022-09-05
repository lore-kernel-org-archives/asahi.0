Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D583C35
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 09:36:23 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id y3so15927473ejc.1
        for <asahi@lists.linux.dev>; Mon, 05 Sep 2022 02:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=UVzntTLQu6YKGPoOys5LB9DBMo84EPi0lKU1jOROxRI=;
        b=MNckiRIE8LkV8gv9kXwA+YdPmsVcMoxg3uHJk/dXUt8ZNStv6zhdchlSrB1QWadX6/
         PBeovOiegG0xm3eNdOGCj6OMMzkWEMe99O4QXBWSX2xZJVhpWNk0Fa3kIQdQYHiclQSS
         XKCtrOe0qRsVUlg0xF21PsS3c4sNABJSog/210NQuRbo72KK0scFha2GEsty8nsYXyh7
         kAHhxa391aREbcDMYY55aLeWdPH13BPViMemJLaPnds5bBY2DHc85OqJvs3PF1dobaK/
         XFImXigd/07wAYfSKhCEaBHDQJkmfSbP5etNqtQRl0uA107nlxW+vDfmWdkG4vjPR/25
         y9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UVzntTLQu6YKGPoOys5LB9DBMo84EPi0lKU1jOROxRI=;
        b=5nBBmVDOtHZcgM8vH7VJ5gVd1hr0xr0UZpVR8Y0n/hyV56Fafn7lu384l65fCmFeQ7
         Rv51Wij2DU+SsOXkfoClxYtueMNmVEbg1z8P2xwqLUQpuuYj0BN6VFxqHRM4M54bz22B
         437SQS+voM/wPxKV0cgazHaVU8dykQhApW8rCw+Zm8jTR1zIqsPDGLvpB49QyPkRR0+C
         q/WXAbbNlK9Jh0tXLX0/sp1WMQKCYA0R14fOBz3CbBvar7PR/iuG5LM8Q58z685jqy4p
         DmE+BWg4HZMBfat0Dk95aLZWVmhLwBVmAd9aXkAN1CZlQp6e6KHiR5nnXzyFECQbgcE6
         f5JQ==
X-Gm-Message-State: ACgBeo3HTxSxCdhKkwPQgZCjMru1a0ZsUhCQqoMPAR1uPspJgyGrA7QP
	gm+Zy0tqioOjjegJp1HEhtk=
X-Google-Smtp-Source: AA6agR6HZnPWDhPjGHZKwHYPw6FFTOmXlHR0ZtPemLi6cU5Vl4zAeyWQMj6OLv6xDEXaiPUuwT6I0w==
X-Received: by 2002:a17:907:6e89:b0:741:a19b:638a with SMTP id sh9-20020a1709076e8900b00741a19b638amr22390703ejc.317.1662370581473;
        Mon, 05 Sep 2022 02:36:21 -0700 (PDT)
Received: from felia.fritz.box (200116b8268cc400942297814b5b37b6.dip.versatel-1u1.de. [2001:16b8:268c:c400:9422:9781:4b5b:37b6])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906300900b00742a4debae1sm4720507ejz.6.2022.09.05.02.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 02:36:20 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Mark Brown <broonie@kernel.org>,
	asahi@lists.linux.dev,
	alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: rectify entry in ARM/APPLE MACHINE SOUND DRIVERS
Date: Mon,  5 Sep 2022 11:35:46 +0200
Message-Id: <20220905093546.19735-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

Commit 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver") adds
a new sound driver at the location "sound/soc/apple/", but it adds a file
entry referring to the non-existing location "drivers/sound/apple/*".

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this file reference in ARM/APPLE MACHINE SOUND DRIVERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Martin, please ack.
Mark, please pick this patch on top of the commit above.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29443aad5031..c239d7e69158 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1904,7 +1904,7 @@ L:	asahi@lists.linux.dev
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/apple,*
-F:	drivers/sound/apple/*
+F:	sound/soc/apple/
 
 ARM/ARTPEC MACHINE SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
-- 
2.17.1

