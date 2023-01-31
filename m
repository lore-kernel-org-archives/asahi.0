Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E3E28E1
	for <asahi@lists.linux.dev>; Tue, 31 Jan 2023 11:45:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 525504206F;
	Tue, 31 Jan 2023 11:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1675165538; bh=/SSdaWTSn4UcCYwRaThXDuHAG6fQf5CoPHUvulP9L7g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gL1sRuUtMbJ3e4VapWDHcEd6lLcmwInTlrj2212aJ7sffJzt4k0ZAwy47jxg2kf6c
	 ff1gTY3Mig/Owi+oNpsRdGN5s02GtL8LTvcLvl1sHpXPSQ6lYZ8m037+J3pJdBAE68
	 GYqFb7N2G2QHV4+MEamgDaSAXaC/LtAv+GSBaeVIbPyU0RLqvH4lpTbLRA0LmakFEe
	 r2UGfAHmUnvJdZBdQUxdr6wtaYeVMAid5F1rvcjzitWLXjfi+obRf4enUkZqZIA0Ft
	 Ldx6nIkP4puqtcT+RT9kqvWpX0FZg2yAS24L+EodY5QBeo3Qlea1vXQcvq6RJwhi7m
	 f6ro/VLYmxiGw==
Message-ID: <232f2fd1-7069-2a74-6a02-a6cc588a3f3d@marcan.st>
Date: Tue, 31 Jan 2023 20:45:33 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] soc: apple: rtkit: Add register dump decoding to
 crashlog
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Curtin <ecurtin@redhat.com>
References: <20230123031728.22515-1-lina@asahilina.net>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20230123031728.22515-1-lina@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2023 12.17, Asahi Lina wrote:
> When the coprocessor crashes, it's useful to get a proper register dump
> so we can find out what the firmware was doing. Add a decoder for this.
> 
> Originally this had ESR decoding by reusing the ARM64 arch header for
> this, but that introduces some module linking and cross-arch compilation
> issues, so let's leave that out for now.
> 
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> Reviewed-by: Eric Curtin <ecurtin@redhat.com>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  drivers/soc/apple/rtkit-crashlog.c | 93 ++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 

Thanks, applied to asahi-soc/soc!

- Hector
