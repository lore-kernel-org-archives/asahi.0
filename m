Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461CF3DA7E4
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010512; cv=none; b=OlMVVT2n74/BTbC9vRA5biI8EfbgvkyyXnmsz157jUq2Y860JxzkitxuZ3GZ/PNgD/wu85U7cDf8+N76WRRoXV/8kbeos5PYE+z1FaenGLvEud689AX4bDLS1dlpBvenaalcH3x9hwE4IHwqyCMbUmew0QIyIwpBlCp8YhJEqBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010512; c=relaxed/simple;
	bh=QNw0DCiBD4kwG/HsRck40hRwum9n25JWMD4YFMUja84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSGlZOXLsfRSHKbVEGTeX9msP5e+8Pj1EhEglfF9eGJQNF9B6EL91MYkIb8zxqWroGt5PVMhqK3Z1xMdv+v4eIcaespDR6kX+CvNNvudWXrmaXEk4fy2rqoFlvDRuXnofx8LOQcTSniz2nylsdyOfEgt0vblYsKgwMZ7svxlYnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHpeP826; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHpeP826"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38df94d4dd8so437873a91.2
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010511; x=1784615311; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=;
        b=YHpeP826K32tBqCN4AxYYdVFxAUOICwr2thHfzePJuo/MPoTOEqX/dD7bozpkfi7Tg
         UeWNc2h//XyNKHSzS2M22xtt6gI582w3l6u68S3QGQhq8u6KeR6fWRospfo9ms1XE85W
         1sSqYREC82EdW8ULhUxZFg5AsI2nLsdAbNH8+5k7dXdogbDoo7LynLsj3eaWTMlUXrKm
         jG2Fz3L5qt9odMXClhrtJw3dE0KImBDLkniupyD7yCAWcfXgu6V18zLlyxLI0FSEd6cA
         ypEdklZQzv3TIfv4Ygy950osmnqoA0/swo9asdMmZ+FQjA/7XRLsilUB4dGdbfBcjzmU
         i9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010511; x=1784615311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=;
        b=PB34FiKTDJDI9cq8oy22Twq9Rnt1dGBd34w1/fTdn1jPeMPBHO0cJ/mQMAtBrRh+D+
         lrhTd/63oUm8EQ7TYiWF1FNGPRgBInI2sHQymUW3KQ4nA9yEFwX8/WNEN8HhO/7Ru8kS
         FG1C0STm56Z2urTYrHxqcLm/XvVmUvf7hTEdJ0vIWtvhD07r48Py5Q8Qbc+yiMTkkveq
         y2/1t9i2pjVrqZVwrvxvzEP5lHdNg5BZz5TedL57QT22n3UI8AjSvYTbFrC63dlIwk62
         MSnWUUriWYf2QyGiN0sLE0tbQO07bzSSDFh6q9ocamKeWBje+MjYGlczJiQQd36uWOs1
         j7iA==
X-Gm-Message-State: AOJu0YzHEn6Glx2YeEreFgP/D7AW+h6JJhOHvQVfqDYMYl0mG0kuQiI1
	7UvKYrk+xx5CWdcjcmYCdEIsWnL3QspnJ4r40g/if2K8LIYmB5cgLgWsf/q0Fg==
X-Gm-Gg: AfdE7cmd6z1CvLR/mprRPVsG6SUjg5hKQ7dgVnhxCRaJrgBvJPkuCp76DtoCA1ABtiw
	t5LZt9uqWJnxXoKzG18bdYtaTXkXRVQn8B7c7P0S+8LERwXQjUMYOsyUCNeki22qiOghw/K+zE3
	6V2bb5FXKKXjCJoJRcdQZdYiJ3RCUB+m3XEAdhnmh5Uj4lxdSh5w0FeS+QGXwBgC7THELZNI5QG
	du0n77JEXYyOC5qJUUvB3c0WeItpWNx5rZ0iKnEGzCtl2BR0rfoujebecJWV51WS+9yUnF0oaCv
	SaNUHtQo+a9zkhGcrWeDmTUgpnUg1mxSn0USWeiptw6eNQsVHgvjKrMdanadZ3/92/OFUUu45p3
	oISQpqUpOcTZUQXcfsXH9w4t2/Sod6+Z82l1qU+8teslXi6gSZJz0lO74zVkH4QCZgrzMqMk74K
	0EnX54E7dDNVJ0ovKYIlH4yAk5ya8aLpREMbh4UI4i0XEEJBSz2tFgNLano4fFsSt9ywyEe87Fj
	9lkK4cDL+0kkT9r2FedmEklNK6JU+GzLiFVfc17fAf/EhDTLPTalZZuNe706Hgg
X-Received: by 2002:a17:90b:3844:b0:38e:2a4:cffc with SMTP id 98e67ed59e1d1-38e02a4d094mr5277080a91.25.1784010510680;
        Mon, 13 Jul 2026 23:28:30 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:30 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:09 +1000
Subject: [PATCH v2 02/12] arm64: dts: apple: t8103: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-2-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QNw0DCiBD4kwG/HsRck40hRwum9n25JWMD4YFMUja84=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xl2bVizuPrUwqnm5vVTFz1aO2fPghT+RyF3tqxT9
 jXY+EH1aMdEFgYxLgZLMUWWDU1CHrON2G72i1TuhZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqHboY/ln4Tlm4uKTh/L6Hy0+I3/ldbmWm/1n550GhuILXrmsdqvIY/kq1HT3
 LK7bntejzROGrPOWv1mXFLUuV0bhwbO030d/vRXkA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index da774096b667..4d6a0411f086 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -918,6 +918,10 @@ smc_reboot: reboot {
 					"boot_error_count", "panic_count";
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			rtc {
 				compatible = "apple,smc-rtc";
 				nvmem-cells = <&rtc_offset>;

-- 
2.55.0

