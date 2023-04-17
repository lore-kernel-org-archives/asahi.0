Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D321C05
	for <asahi@lists.linux.dev>; Mon, 17 Apr 2023 08:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C35C433EF;
	Mon, 17 Apr 2023 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681718863;
	bh=bIltGGJ6YcOhoza2HEf8IC35/kY4YKdMLPy5ID3ijTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cgHostyGrfLJJ2W5utfqD9Gjo+cNUR7gkyjU5jh/+V8A0sDdwYlo+jPD9DeDOMVq/
	 Gqkkz4RHPnA+N9r6HlMT/qzJK1zL+C1WJBuKF1eOD/RWbXfzA37bggdoxSAGlIjRXc
	 QCtJysjtw5tGp/R0nvN81eH5LDzszO/5ZocEt5Ts=
Date: Mon, 17 Apr 2023 10:06:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hector Martin <marcan@marcan.st>
Cc: Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"John W. Linville" <linville@tuxdriver.com>,
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] wifi: brcmfmac: Demote vendor-specific attach/detach
 messages to info
Message-ID: <ZDz-F50Zlwkf2njN@kroah.com>
References: <20230416-brcmfmac-noise-v1-0-f0624e408761@marcan.st>
 <20230416-brcmfmac-noise-v1-1-f0624e408761@marcan.st>
 <2023041631-crying-contour-5e11@gregkh>
 <8b2e7bb9-3681-0265-01bc-e7abdd0d08b8@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b2e7bb9-3681-0265-01bc-e7abdd0d08b8@marcan.st>

On Mon, Apr 17, 2023 at 04:54:33PM +0900, Hector Martin wrote:
> On 16/04/2023 21.46, Greg KH wrote:
> > On Sun, Apr 16, 2023 at 09:42:17PM +0900, Hector Martin wrote:
> >> People are getting spooked by brcmfmac errors on their boot console.
> >> There's no reason for these messages to be errors.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: d6a5c562214f ("wifi: brcmfmac: add support for vendor-specific firmware api")
> >> Signed-off-by: Hector Martin <marcan@marcan.st>
> >> ---
> >>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/core.c | 4 ++--
> >>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 4 ++--
> >>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/core.c | 4 ++--
> >>  3 files changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/core.c
> >> index ac3a36fa3640..c83bc435b257 100644
> >> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/core.c
> >> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/core.c
> >> @@ -12,13 +12,13 @@
> >>  
> >>  static int brcmf_bca_attach(struct brcmf_pub *drvr)
> >>  {
> >> -	pr_err("%s: executing\n", __func__);
> >> +	pr_info("%s: executing\n", __func__);
> > 
> > Why are these here at all?  Please just remove these entirely, you can
> > get this information normally with ftrace.
> > 
> > Or, just delete these functions, why have empty ones at all?
> 
> This is a new WIP code path that Arend introduced which currently
> deliberately does nothing (but is intended to hold firmware vendor
> specific init in the future). So we can just drop the messages, but I
> don't think we want to remove the code entirely.

Why have empty functions that do nothing?  If you want to put
vendor-specific anything in here, add it when that is needed.  We don't
like having dead code laying around in the kernel if at all possible.

thanks,

greg k-h
