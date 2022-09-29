Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42151C3F
	for <asahi@lists.linux.dev>; Thu, 29 Sep 2022 14:47:53 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d10so1647755pfh.6
        for <asahi@lists.linux.dev>; Thu, 29 Sep 2022 07:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date;
        bh=6ALsB1tmXnl0zoWYg33TINCP8Bce0ftiM371Ppvanvs=;
        b=cQC7tvanffSaxayrUktJYUnwc0rmXBsQVqxKrIiFM3rRETJo1JcCxTE3BqaUi+hrze
         6lczO6t8f+If0GQYs6W5hy38Zr7AeaFxmIWYadZ3N5vmQertIVfFRehzWuyNXDBiIn0H
         c6RzH0zMKgWWuAUr2gogY6w9004AIKiuV6ulWQOWHu55ryiUYbH8xTpjGHnuHwTB3Tgu
         M+BoMtzmXdMg2LXl6oefMK99adW4NgphGH8Q3KkfUhlUCviAxgnroJjiQmvVLafmM66X
         9SDV5jUiykWk0z3v1YOkGnytzM3V/bJCssINScmREGp3kn9JNM66rWGiSf8rrRfRAxzs
         euow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6ALsB1tmXnl0zoWYg33TINCP8Bce0ftiM371Ppvanvs=;
        b=ce8JqF4QWGrthVQG9CFZ47U9gE/U/AqtA6GtdIZrZg+X3qFt9OBZoCy58whlDEv9AM
         9dNzxJsl2hFvsnpbz7LLu8wphntTmoAGZIdb1rowDgguglqzlOpyma66LaFfkTICXoie
         +uhancz8/yj1afkVsIz/jIDaHZsGtYk2mra6jgv30/h/YCoc/GtgU2DlBTRTtAwO5zG5
         uE9+8VgQmR6px5Sr/mkTsvovIF/v4NLKy2QaDngCOGZI5dWjvPt66l8tVrhoqjTF4c6Z
         sW7Suc4HwjNi0wM2hbjzX0FrgsMVkXxz8RHXcP6P/IBjWTDTQMNqXLMMAJKGfLKQwe+N
         EYPw==
X-Gm-Message-State: ACrzQf3h0ttxTQAHMJilYm379otz9V5MvGa5ewCCO209O8zQQFrZXNPT
	/n2EpADh4TL22HaUQLkt7nU=
X-Google-Smtp-Source: AMsMyM7FxCixLWliVwNlwSdex0xllaIp4Rfe7rtYJOZrlnLu5OztKXFvWf92Zrr0OS0digSeqHzRhA==
X-Received: by 2002:a63:6a47:0:b0:43c:a935:f0f with SMTP id f68-20020a636a47000000b0043ca9350f0fmr3304125pgc.95.1664462873185;
        Thu, 29 Sep 2022 07:47:53 -0700 (PDT)
Received: from smtpclient.apple (155137199074.ctinets.com. [155.137.199.74])
        by smtp.gmail.com with ESMTPSA id 194-20020a6217cb000000b0055820958928sm6250930pfx.29.2022.09.29.07.47.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Sep 2022 07:47:52 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 2/2] irqchip/apple-aic: Add support for A7-A11 SoCs
Message-Id: <45292E45-8CEB-4970-A087-0765DD96B0B5@gmail.com>
Date: Thu, 29 Sep 2022 22:47:48 +0800
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 asahi@lists.linux.dev,
 devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Marc Zyngier <maz@kernel.org>,
 robh+dt@kernel.org,
 Sven Peter <sven@svenpeter.dev>,
 Thomas Gleixner <tglx@linutronix.de>,
 towinchenmi@gmail.com
To: Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)

Tested-by: Nick Chan <towinchenmi@gmail.com> # iPad Pro 9.7-inch (Wi-Fi)

