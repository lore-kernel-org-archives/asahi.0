Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D612F24
	for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 09:04:23 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-52ee632329dso178491387b3.6
        for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 01:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oY1nkRMg5xIYxJkEJudISp1SsePMPZsPbFvRS2TeTYY=;
        b=rbaWe+oRzVt/2SLnetpU2Uetj0VRu5i96tclNSePLjUiG/eeF6v2jHAVV+KonBcNDb
         v27l30iursquX/OPnVQ8FueErDRIpLPGc8LDk5Y61NP+6j9YsBMGDjsZyj0GPrH8XVBt
         IKckUdR/bYdLNTBpDUhxP3Hprta9kEe8Xs0qP7tYlxlDQfRle3Jx7ePaqkyWg6Ns4Hwr
         GOP9VKetqUZ1xbptXVWOX13bFKj5ySVw3ieN+CjuzghA/sjQ01x+On3gKCTryVkx2mTB
         tK8uX1jAzi/T5jUCnwW3W3GjVJ7NLJRDOffeYSjLzrW/EyAIUV6BASdvTs4Rn7y9I9uB
         /82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oY1nkRMg5xIYxJkEJudISp1SsePMPZsPbFvRS2TeTYY=;
        b=zc/gwkfZnLDu6Co9REnxdcReJzJy50KrUUux6izFPhd3XJkmqChOSZ27MMOtu6DyOU
         n2LgoF08d5mGLQqTsvyZmvyFIvGj3zOj14uJNg3Q/CRnU05MIatfBm7UdkZzJIyyQxhS
         plBgHii9VCYLF+znQoI6yUvYHL8XMDUzwkbCvnEq/hS4DKVv+Q853bYEX0ae1KUqhmxK
         J9+VMBMv5C6iOacO2Zz1Yk1UsZVpcC97Emh1q53cRpb+zPC8D1MS8S5zKLSs+0uDO9/u
         IuKqqObTOpo1fsYbWTftzjmgvXF2Ddo/UpQOC2cm75uqC8XslPRTzbK23gYvfi8vmykq
         bowg==
X-Gm-Message-State: AO0yUKULjGhUp65TEbPAPdl+Bb6Na1lv8CSkAADhHhRIJXHn50kTNKju
	o+xJpH8I2kwP8gUrdnv9by/tUS5yn5g2i69lbBB4gQ==
X-Google-Smtp-Source: AK7set/fL3py9MtVnDFb7krzubxSrlxFlH3/cnycfcvpNmIE0uFAsbEzQ91Z9mMtjkDuqLB9Qeto8GMaBNULqAVkmrs=
X-Received: by 2002:a81:a008:0:b0:52a:9161:f533 with SMTP id
 x8-20020a81a008000000b0052a9161f533mr238975ywg.64.1676451863017; Wed, 15 Feb
 2023 01:04:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230214092838.17869-1-marcan@marcan.st>
In-Reply-To: <20230214092838.17869-1-marcan@marcan.st>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Feb 2023 10:04:11 +0100
Message-ID: <CACRpkdaQ6L399pgPAiyOtXkAYhfaOdPWqvVjXacDt0+-Oa7N_Q@mail.gmail.com>
Subject: Re: [PATCH] brcmfmac: pcie: Add BCM4378B3 support
To: Hector Martin <marcan@marcan.st>
Cc: Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	asahi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	brcm80211-dev-list.pdl@broadcom.com, SHA-cyfmac-dev-list@infineon.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 10:29 AM Hector Martin <marcan@marcan.st> wrote:

> BCM4378B3 is a new silicon revision of BCM4378 present on the Apple M2
> 13" MacBook Pro "kyushu". Its PCI revision number is 5.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
