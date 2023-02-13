Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C3A33D1
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 13:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDEEC433EF;
	Mon, 13 Feb 2023 13:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676295925;
	bh=Nouoz0V3KyjK32tUvJB+DgTGfTacIM/L0pvOEy6vqCY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jVh0MJJVi+1/fp6YJ96GyqoKbVAd7tI1aSwMPcL45uCJ/FP5vi4+UkLss+EhGMxrj
	 C9EPZUyFd/hheaRMRj6P9SgVUWtz1ZbqWLedMdtd17iQS7dmGtOmdcR8Dj21QJLzMK
	 XDElvldvm/7g2W/LMU6+i+hwGQNrPUVo3xko5uqgJl3c4NCnTSvd67OQ37rusm0U8P
	 BzdfrTdDjtUZn1pDbtyN292KXs81ZSi+Cv7t1kpR8jGMJXU8OVDzb6o+qgcngZW1TJ
	 JSXg2igwVTF1/YBmc63wiO/cMzKR5n7FFNdj05g44oGF6HFxK0KjOzPXzlByGWa2Ay
	 3hObGdMf8bPTg==
From: Kalle Valo <kvalo@kernel.org>
To: Hector Martin <marcan@marcan.st>
Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>,  Aditya Garg <gargaditya08@live.com>,  Ping-Ke Shih <pkshih@realtek.com>,  Arend van Spriel <aspriel@gmail.com>,  Franky Lin <franky.lin@broadcom.com>,  Hante Meuleman <hante.meuleman@broadcom.com>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Alexander Prutskov <alep@cypress.com>,  Chi-Hsien Lin <chi-hsien.lin@cypress.com>,  Wright Feng <wright.feng@cypress.com>,  Ian Lin <ian.lin@infineon.com>,  Soontak Lee <soontak.lee@cypress.com>,  Joseph chuang <jiac@cypress.com>,  Sven Peter <sven@svenpeter.dev>,  Alyssa Rosenzweig <alyssa@rosenzweig.io>,  Jonas Gorski <jonas.gorski@gmail.com>,  asahi@lists.linux.dev,  linux-wireless@vger.kernel.org,  brcm80211-dev-list.pdl@broadcom.com,  SHA-cyfmac-dev-list@infineon.com,  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] wifi: brcmfmac: Rename Cypress 89459 to BCM4355
References: <20230210025009.21873-1-marcan@marcan.st>
	<20230210025009.21873-2-marcan@marcan.st>
	<0cd45af5812345878faf0dc8fa6b0963@realtek.com>
	<624c0a20-f4e6-14a5-02a2-eaf7b36e9331@marcan.st>
	<18640374b38.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
	<e9dbfa3d-6599-94b9-0176-e25bb074b2c7@marcan.st>
	<BM1PR01MB0931D1A15E7945A0D48B828EB8DF9@BM1PR01MB0931.INDPRD01.PROD.OUTLOOK.COM>
	<18640c70048.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
	<180b9e56-fbf4-4d98-3d18-a71f3b15e045@marcan.st>
Date: Mon, 13 Feb 2023 15:45:17 +0200
In-Reply-To: <180b9e56-fbf4-4d98-3d18-a71f3b15e045@marcan.st> (Hector Martin's
	message of "Sun, 12 Feb 2023 04:15:52 +0900")
Message-ID: <877cwl65n6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hector Martin <marcan@marcan.st> writes:

>> If Kalle is willing to cleanup the commit message in the current patch you 
>> are lucky. You are free to ask. Otherwise it should be not too much trouble 
>> resubmitting it.

FWIW I can edit commit logs as long as the changes are simple and the
edit instructions are clear, ie. it takes no more than a minute for me
to do the edit.

> It's even less trouble to just take it as is, since an extra "v2: " in
> the commit message doesn't hurt anyone other than those who choose to be
> hurt by it. And as I said there's *tons* of commits with a changelog
> like this in Linux. It's not uncommon.
>
> I swear, some maintainers seem to take a perverse delight in making
> things as painful as possible for submitters, even when there is
> approximately zero benefit to the end result. And I say this as a
> maintainer myself.
>
> Maybe y'all should be the ones feeling lucky that so many people are
> willing to put up with all this bullshit to get things upstreamed to
> Linux. It's literally the worst open source project to upstream things
> to, by a *very long* shot. I'll respin a v4 if I must, but but it's.
> Just. This. Kind. Of. Nonsense. Every. Single. Time. And. Every. Single.
> Time. It's. Something. Different. This stuff burns people out and
> discourages submissions and turns huge numbers of people off from ever
> contributing to Linux, and you all need to seriously be aware of that.

I understand it's frustrating but please also try understand us
maintainers. For example, I have 150 patches in patchwork right now. So
it's not easy for us maintainers either, far from it.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
