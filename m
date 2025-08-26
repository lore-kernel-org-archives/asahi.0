Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E83218C9
	for <asahi@lists.linux.dev>; Tue, 26 Aug 2025 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756210191; cv=none; b=BpcE6McvPUk0yF20z0GmvEXCbb393v2QTAyrJHpogNbt1C3MA5TXvbeZlG4kVn7u2+7qwm5GvBFS2oK9IrgEt7m6cXvDxnLHycLeZDHLxlbWjizmv7Rl1lNNUWLhwzFNFE6mu6xguAVLpp4hEXPi3fUbZmJTUTQ1nBFxmG4WHqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756210191; c=relaxed/simple;
	bh=QAiPwZypg/VMlrPIBhr0fWYCSyBf5BBQP9eNNCiNfG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=axIStiNyd2vxM1DBHxDmoR02kaCOveQFH63NT8VRsSN06o/xbChyWx5SLO/a6vWQbBWtI0nllXvEm9E6B05VhRi3ijj4hjc8VMsvoJS5OPrEO/n3RydoythSTcf/b0aSwUca4Yy9laYj7DWD12EQ2O3+DvoYsPVFBRAk16jRakY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTfLDd0C; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTfLDd0C"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2449978aceaso39531605ad.2
        for <asahi@lists.linux.dev>; Tue, 26 Aug 2025 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756210190; x=1756814990; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myWZ5KKugg0r3Iz22gx0u77eYst6AR+R8GzbR5T+YNo=;
        b=UTfLDd0C/qHwdpyQltwr3Thx0rQcPsXhYrUVFVNkUCF5rmSMPuLWI/rQHHt29VTaL0
         A/vxHf8kxTmZeYsq9TaKN5U9bfnbOIxHUrrER7nOMudOD0Vcoj1vhCVj8ZcVEYE1B9IK
         RtXX/ATzYvLFQWl0E5w+4QG/XAFJVRo6P5DybsFios2GwrZ3GXlb+DtGbYjF06QIUm/5
         JHEtXJZho5hRuUCUfkz5WcxSWjvycvk5owhMliwgYYX+BC0uouSzpEynMhc9BMnp1pv5
         TK5r8oiLNbS14tfbwn5SlnP2jXEysBfZOurC7euFTdYAP9lHzjZEDYTM444CptAJPtgd
         NuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756210190; x=1756814990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=myWZ5KKugg0r3Iz22gx0u77eYst6AR+R8GzbR5T+YNo=;
        b=XwYNI7HgoZuwdoq61mal7yYc18yfyYii+47TZkBkZ+u44k9I5XOG0aA7H67R8u7x7H
         GgtjiZhJs/xuvbmHumh8u6hRi+PFy4DZOIdN75tUUhhhEjqrSm3QowcltrkztjyslQZT
         lJOOdcKb5DccMbr5lPo/Zygc1tw7PXPr+gPpP8WCq9CvOHIL5bhHn4ufZRIi+l5JPb0y
         fvhdnP6m5SKe7BnmSMxuU3rYERrEfRJ4C0pHjBBEbRfKlPh3XyPscJGkY7v0L8c/SQg1
         IQCGU83N2lsZgWr3K94Dpdsjwmn6XNVETvA3j1MTz/bU9v2Zc0Qxrd+sm6ACaPCd91fK
         fBrQ==
X-Gm-Message-State: AOJu0Yxdb8MF6KHxPMp8Dw3+jVonCz4otfvNIG29FVfoxx7Wjcne7YAm
	Bhf1UmXs2Sq2YPrNWypeBR4862uBW38LQoCRirA2F/F8UoLEE22vt3b1
X-Gm-Gg: ASbGncvLbS8VRH/faB03akbf4NIsgQcqxekvYb6kXUtdaM2LQdIQl8vyzNHcWgH2eHC
	8emm0mfwUb4yjszNWIazvdjQvHVURnrZ0X4oKS8EivttKM9xTDpNV7X8V6YdRoLowGwYYOrjark
	CEUg5gk18Pfxd/PhBPiIIe/5/6QYbKHAAnZd7yec8e6ofU4zGarZbadnKnqtuSvxcWx2o+yn299
	N/+dHYVWWd047NDqi7fFfORiffOy5EyUVNDXHfLE6mbfzknKlrut/rewO2/bYp1IVWZBiweo9Ed
	jVhPIpVkI00CW/cdQyieyGCzO3oKldJk53ylRrCC5YERxS+SZNg4G6O/4tKx62StVp9GPfWDVsR
	8T++3UmxTPqYftJopqTPOJXUWc0I=
X-Google-Smtp-Source: AGHT+IFCs+0+QPpGE5rod3ewcQ6LEfg1s385+SmIISqW/6UyVrO7Bz46rSAw1PuBDWqjvwCmypo/2A==
X-Received: by 2002:a17:902:d4c6:b0:246:eaec:2994 with SMTP id d9443c01a7336-246eaec2c7bmr90916255ad.49.1756210189659;
        Tue, 26 Aug 2025 05:09:49 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-327565d3924sm619966a91.13.2025.08.26.05.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 05:09:49 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 26 Aug 2025 20:09:12 +0800
Subject: [PATCH v5 1/4] dt-bindings: nvme: apple,nvme-ans: Add Apple A11
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-t8015-nvme-v5-1-caee6ab00144@gmail.com>
References: <20250826-t8015-nvme-v5-0-caee6ab00144@gmail.com>
In-Reply-To: <20250826-t8015-nvme-v5-0-caee6ab00144@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=QAiPwZypg/VMlrPIBhr0fWYCSyBf5BBQP9eNNCiNfG4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoraQDfcGlhRdbNX8kCRUtLsCfOQJIqHlyC4YjU
 BwPiF6XsVuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaK2kAwAKCRABygi3psUI
 JGGFD/94mzTsBZpIQi24EhnHzwccGc0LDw8hGHIljz4WJYYwVsLfVquxUWdYAB08y6fm2eTVo0T
 MNh3t5Gt4Lh3wL2DcI3SFCG/3IVipT+XGVbX/r0RpHiDos8ZCg0QVtF1/on4amZn3T7qwmGqdSF
 +ySBYE7E4a0CpSNlC6GGgPOfGwrMeUVshCdM2liaghAVcPF69QMylAeYPUIc2eDlBbRZT0l/A5J
 vERkbULAJPwxT3bW0dV3fnqj0X00lXQdSiL7sxiZwb01qxR1zX+XGjyGfP2nm31y7vJNTt3Pb1g
 yyZVEoS2SE9lU44S1PBS1NZyMbrWu8KHWJ3NtkDJve5EQBcqJe4kJCvqWEuBZudmGTaPnbYx+bv
 se1nOzWouaav74L8nOGYFxS+CPCAxCzaZ1BcUYEdZ9DQ3EAMXaC61OOkWbPZQ+ZPFZydGk1kQ/o
 VOBAQTqno65pINclM5H73eZNQIy3rWDQF476WxLpc6hGY5fY2s5OYcFgBw9lFfXUzHYB5WeoXct
 h9Tv0rP6qPkmlAqsa7tDZGnLAilKIN5d9kHLtdB04LSzG0vSTzfFnzTdsLrIaQ39oKlEV7YkQRP
 vGpOy8z2Jdc97Qrtgt3Ue+iVUHC83WYvyGsh/r1HGcMkOBqEBADXHbNEPJvu1Aa3YSRgvJaqy+E
 OLsg8E+SBMa0Ktw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add ANS2 NVMe bindings for Apple A11 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/nvme/apple,nvme-ans.yaml          | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
index fc6555724e1858e8a16f6750302ff0ad9c4e5b88..4127d7b0a0f066fd0e144b32d1b676e3406b9d5a 100644
--- a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
+++ b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -11,12 +11,14 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,t8103-nvme-ans2
-          - apple,t8112-nvme-ans2
-          - apple,t6000-nvme-ans2
-      - const: apple,nvme-ans2
+    oneOf:
+      - const: apple,t8015-nvme-ans2
+      - items:
+          - enum:
+              - apple,t8103-nvme-ans2
+              - apple,t8112-nvme-ans2
+              - apple,t6000-nvme-ans2
+          - const: apple,nvme-ans2
 
   reg:
     items:
@@ -67,6 +69,7 @@ if:
     compatible:
       contains:
         enum:
+          - apple,t8015-nvme-ans2
           - apple,t8103-nvme-ans2
           - apple,t8112-nvme-ans2
 then:

-- 
2.51.0

