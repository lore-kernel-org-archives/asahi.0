Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF56F1E5205
	for <asahi@lists.linux.dev>; Sat, 25 Oct 2025 00:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351965; cv=none; b=RnUXhLZA0Odm2EIg/TWmyoWHGGYYh7ISuP+Q8rOA8rQxk805R9+Au2bvxFXOgJHnlH6DmTsVJp8vaF7Du0cOQPDEx8uFNxohI2RK/v9UlTuR6HRTEmcnIGS9N6DOXECJxXbZZ1T/nkkOZC4IOTyt8AYlVHAHk4GzZN7kycAL5p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351965; c=relaxed/simple;
	bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OnzVE54FGaW4dYANi3dEz/zEloB70hXGBdEzkR5rLLVF7A820I8wnIOR2wOUQ49M7gKXBPJMybL3ADY4OL0N2dZM303spgr4CoGlLiHLS9kKIXjj4Xmfa6AWpJVyB/qH8fAl7pRJoNajAu9YizCJ6ZtVFYIv/DFhgYClMV/JPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5EpRzgB; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5EpRzgB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-26a0a694ea8so19347855ad.3
        for <asahi@lists.linux.dev>; Fri, 24 Oct 2025 17:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351963; x=1761956763; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=H5EpRzgBmWeZZrx14lCsvh+rYimuR2tG6pONLKk235mWNucuT1jb717UvEKt/QDnls
         vPKh6pKDs4fo4DH35OfB2Q8HZpnfkRq9qGrPqZ7S/yXXLcH0YvgzIFEMBkaAiPd2KHs/
         A2XRp9RVhwvja2qoTKfUvnhNubEQny0lKrH50XvCHNUFO3VrON+WRMNYK/7TChwMf0JW
         PuYb/on0U3uSq+5l86ct54sMBpvNYMFaEtqbyurrm/u6pKYoy6rOfLQxyZBj/o4TmjSB
         0h8I/UbNer7AvsWHuo1j+wkJjuDPdmUJsdC+Y22a5xFN4R05Rm40Xn6zDF67w0gQVldw
         0jVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351963; x=1761956763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=oqQ2g1tKiOK7w93Uqs2Etx8US/ptMJg08XeatXQI6url2SoOAoPTNgiGy+khn9vd2S
         ri2yivo2mV5py2AkaMFel9tn/cQHsZCrkKp/Vq9VXdmV4nx+2e1r1/zmUBHvRHE8CRj8
         HKm/eUyPbH5LLIPUmKvFGaQKDzngnWqEZlNOEIEzWxuWaP/yymPv40Bq1nwYFTKpHwyO
         04vtppNZxkjwG1Nr8x+72xVo2V0kxVSeqgAPHab0YXM43UWF+xdA66UU1zqqopHXm9pu
         KxWHLPSCS8Mo3dlX101aq1wf+AafCev9n4TpTLXNmdQj1KB+yFhzsM38cLkJPKPzu5id
         s06w==
X-Gm-Message-State: AOJu0Yz/sfhi4MGxXzzGSSKFgwbdaSwGMJQ4m/26k13CWk342ot/MY6q
	uqmCiN1pHui2sgyf6Mm22fBFyjzqOUlPo84SnikJlu49k8uFQF4iKWYM
X-Gm-Gg: ASbGnctedSVM3+X0rZJ1wkZZHsm+UMLdbjlGNRNlhKEpOZPw5Jl19RJ61HlTlpkKJnK
	AyqInQ89LqMpaDG7tLGovjsxWpHWn8E5NZsIOx9Wazbni1xMObvtBosJPCwK95/5UUR69r1r+Zf
	CxGvSJt7j5oJxf4pqN5mS6pJBO1Q14kXu26j0lGWKW3XMadyFag/j/feh8gNvWJnQLmatG7j05O
	Tf8kV0OJ2Z9XZbHA+xXPJ4BEGMcRltTncv87O55uiChJrwJca9Uf0skXPEEX2Rm9EoifDclSSoB
	CVtmb6XYt+DJPw7NVuBJK4FEMNwpu9XIgssAsZbXXBGv8+rQUpV0HZ2b91Mg9LZ8lM0y3i/qsl1
	tl0dkPWDOrQDRo8ggGA9CbErm4mG17GhvrohJbLrK8GcN+wXbfdVhGufVOLBZ/m6j88rYqgksDu
	tHY7wwptYkK4q2JMzSneWUEubP1T/5wkxAqG5ZTDIv9QHnIXWd2HDn8fNkmqAPHK8PjYsIcXbEs
	y/y2dgLAuY5S91NIf3/9gVJWuRJlujrUqjebH2u6q3a1s/QLCFjTA==
X-Google-Smtp-Source: AGHT+IHSa7MdO+RyudQ13l7ZBDW5YjuDQoXfBKNGzygwW/8ijBbpH54bUrATc3DfIp5eGwuXkgv2HQ==
X-Received: by 2002:a17:902:fc44:b0:26d:58d6:3fb2 with SMTP id d9443c01a7336-290c9c89697mr387774495ad.12.1761351962920;
        Fri, 24 Oct 2025 17:26:02 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:26:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:40 +1000
Subject: [PATCH v4 09/11] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-9-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM4d3hJqcNPewfPwlleiK7fkXZLhtVltl2i2UGbKY
 wMxq6iQjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFQ32DP8D1tQvEl5SoUQr3Tpeel9LQEufdveGjjeWpK55erOQgadQ4wMBy1+6wZ
 LhiSptYttjWV5voFZ8fr10xZCNt+PsEww+B/ACgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 51dd667d3b5f..3b69eb6d032a 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-input"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.51.0

