Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7A047C113
	for <asahi@lists.linux.dev>; Fri,  2 Oct 2026 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934596; cv=none; b=pMbjSs//F4QUj8kMF+Vh2S1N+yuDRxcGWWt6OCSC+JkJ/0mx5ObjDMOWpYy7sjGdwF6o6TJyZCCwt8w40sLUFUeo+cJmBxZjCpBud3dny/ISb98sEbo3ZN4wSv2Oau/DGw3/9CfEdexBw4bDmkFHBilEVATH4Mm7DShVn1Qiy4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934596; c=relaxed/simple;
	bh=cSMKtHhDDIrlu9/TZiEcgG2pQVjTFVtall/R40Ims+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNrlxO5dYeNlQLY9eurmVU7boD2Iiu7FRkPtjB2Boiw2/AdKh16kVoie26TEBhSwkdHy+owtfrhSg+9xB3LIt+kaQ4MPqnqlBDXp0rxmTKwLMpBtZoe1Rfg2ZTfYAYTRcEnWAM3rdgO3fIHsuF7HRdlbc3AzOBHv2qEJGBCR2HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AEo9mx4n; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AEo9mx4n"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso46770795e9.2
        for <asahi@lists.linux.dev>; Fri, 02 Oct 2026 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934586; x=1791539386; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtlxzGADVLpRg8uWTI/BZ9pWlYGLrKbVbyi3KlCt684=;
        b=AEo9mx4nN411BvOsgLsnfums8lZmbeUXhVyxwspe2fYkq+Q2/8SBkDdEiZ0IhBnVLp
         s3kf+/s5QLmAoC1ZI/iMtPB6OhtJd+6YMMTJzCto5sSHB4b0fN0LnMqUh9hN1clZ6yro
         BCTvKyGCQTLj7pOVDKqf9WhmyS1RRuq87UVwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934586; x=1791539386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtlxzGADVLpRg8uWTI/BZ9pWlYGLrKbVbyi3KlCt684=;
        b=Bb/HHWYC1QZCueT/CSBPu2WADCZaPuUvx1QOj1XxhpEsHm4WZBBLhk5nhruc9wqoJ5
         djPJe2ikPSzP2qP6DzKdpHkOzZfq3WX150nQ7HFWkVitm+Bf8cxF7/LRtYXQCYZqnpcB
         d1boidaEfFSL/MmfliGeqTmZLlKnNlXi3Dm6eNNtX0Kpmb9jSmGswkJRpszrw7bTkgSW
         BYy3pD7SbbCp6iUgLttenrSIUKCRYdvcFJ4vyWT5qcaNR6RDEX+DbcB7eIHEqujvYLxh
         SO2HHC+UTru78eS09vuk3+stw9qCNh2NgIeZBCGtsOZDrewdESiHFBJWi/NUm2Ofn0i5
         7/HA==
X-Forwarded-Encrypted: i=1; AKwUvByMJZ958zKHVNKRBnj5LUQk/FaKjSrQCv4zwPCmGUjewNvOsBydTS6wkGPP7UB9hhK8K66xbQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nY8skVWdB7NWhC2cOiwZWXQ/dmmhc4BvtcwnXalNJlsRigm7jM
	xxkleHZSC9LMQQioUPS3k1sNhsEW60Wt9Yn9DQzOwcmoFyVECXpChNwwDsOw7VXvPg0=
X-Gm-Gg: AYBFou0pkloVP3SPo++PEl0PUOO+0MQx4SFr+gayXvDzHvtGWhHzsTs5y9SHGDzR0Qf
	FpYhiB54FAx1F0q3KDCFnD1lEjBY+ib7tENtm34Ird0V2PMe4XSiFwSxOAhW7ork47d8e04sXxw
	w/lkwEApE7plXKvBLCjZaUUA0N/kNmaZaBhU1hVHJB2J6ab60dDMl7x/CnqUJJTpCql8kwMlblX
	/P7Py5r27173+EsauBCTCAQEh0aaaeMcFiWrNHzoZlKYtQxeXoQ3tcXa9NIoha6J22i4j10YQCQ
	Vj7KZXwDH3qnDhW1F+SitbJsztvwzp0/eUt5SSpHsGL3pV6TP4+3Rv/B+9Rj1ggPQ26VhfzURNS
	gAnM/43ff/l1W+oUzgwut7TOcEWj0a/b+mGRaHDAe1vXy7b/ECVsYZ8G1LfCReC8YsTXmWnrqY4
	3a+igJzUhfiiOhIWqTYZFoSz2dgi69ILPCx6Z6xgJhf44qgencuecCZ7dmZ5VDyvfqBna6jlo39
	cM=
X-Received: by 2002:a05:600c:4e55:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-4a02755a141mr40643525e9.14.1790934586627;
        Fri, 02 Oct 2026 02:49:46 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03fef5950sm37281695e9.2.2026.10.02.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:45 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:30 +0200
Subject: [PATCH 1/5] ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-1-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>
X-Mailer: b4 0.15.2

From: Michael Trimarchi <michael@amarulasolutions.com>

The pcm179x driver gains support for the PCM1795 and the PCM1796. Both
are register compatible with the PCM1792A, so they belong in the trivial
codec schema.

pcm179x.txt no longer exists upstream, it was folded into
trivial-codec.yaml when the trivial codec bindings were consolidated.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 Documentation/devicetree/bindings/sound/trivial-codec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/trivial-codec.yaml b/Documentation/devicetree/bindings/sound/trivial-codec.yaml
index 9a35dfb17349..a24a21c855e1 100644
--- a/Documentation/devicetree/bindings/sound/trivial-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/trivial-codec.yaml
@@ -36,6 +36,8 @@ properties:
       - sdw3019f836300
       - ti,pcm1789
       - ti,pcm1792a
+      - ti,pcm1795
+      - ti,pcm1796
       - ti,pcm5102a
       - wlf,wm8510
       - wlf,wm8523

-- 
2.55.0

