Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EA228505E;
	Thu, 14 May 2026 16:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774903; cv=none; b=VkZ9nb/0A/3ZAagD+l3OyXOzS/3B1PHk8bbGKuniMRwupSERUGE952oY93iAEIO83X6+0blOSzFtCoWZuXzo/wzzABApl6zf1D7wfitItgRtQutvk/Nep2IWV+fV4u/wmKUHKzbSqF3iFgPXP8mykg4/c9XiO8xpywkuDztyLD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774903; c=relaxed/simple;
	bh=JgMf4wRpFiwD3alNMNl5XaWiw8QaBk00SyYTww0vZHg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PuBwNxT3FBjHUUqMpkzwfkjuzoYm9GhYCvbFzUdNKndakapydQJVnwPMqCf7UpzFIRDrpiSuIDML6Vk+H8mG8/2TB7VekZb9O5SpTTR4iqrWS/7HhTwc1cdW+sir6kFo6oSEAP85Ve1ImLb+n6E9LSxtLTCAl869NCPo8M7MwcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QX849FNd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QX849FNd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BD6C2BCB3;
	Thu, 14 May 2026 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778774903;
	bh=JgMf4wRpFiwD3alNMNl5XaWiw8QaBk00SyYTww0vZHg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QX849FNdq4n1pmDeYiczWfPi/yO0SBj6+z6Hg34KhSCUe8UfPKXfpb8S0/gUq29Rw
	 ntpr2ddLBmVU18R2dqsRINe99c1TKju9sCH4QXRCdj4ipVNkOUhTmISarVEy22t1A2
	 xG/jtJQe+j8jbDWhtttJr72lMk2Vx227JPBhzPIlHWgIi3HrcFwl7ZuT6gCacmvAR/
	 g7xfAevIhvbGXRgGXQWifiehUTDcd8DU4s09uznuhJUSbcfrrfWQEsRFs2m0j8Mfd9
	 LqcmF+oT4TACdpt1zxcpaoIOSvttx/snQU9nuc0cSX6nkQkcFTXphvvuImPdJx9q0O
	 ryA+uquraHqXw==
From: Vinod Koul <vkoul@kernel.org>
To: sven@kernel.org, j@jannau.net, neal@gompa.dev, 
 neil.armstrong@linaro.org, marcan@marcan.st, p.zabel@pengutronix.de, 
 David Carlier <devnexen@gmail.com>
Cc: olteanv@gmail.com, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260508201958.30060-1-devnexen@gmail.com>
References: <20260507163746.108086-1-devnexen@gmail.com>
 <20260508201958.30060-1-devnexen@gmail.com>
Subject: Re: [PATCH v3] phy: apple: atc: Fix typec switch/mux leak on
 unbind
Message-Id: <177877489977.1079578.13272721889190867698.b4-ty@kernel.org>
Date: Thu, 14 May 2026 21:38:19 +0530
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 08 May 2026 21:19:58 +0100, David Carlier wrote:
> atcphy_probe_switch() and atcphy_probe_mux() discard the pointers
> returned by typec_switch_register() and typec_mux_register(). The
> platform driver has no .remove callback, so when the driver unbinds
> (e.g. via sysfs unbind) neither typec_switch_unregister() nor
> typec_mux_unregister() is called. The framework reference taken in
> typec_switch_register() (device_initialize() + device_add() in
> drivers/usb/typec/mux.c) is therefore never dropped and the
> typec_switch_dev / typec_mux_dev objects stay live forever, with
> their sysfs entries under the typec_mux class also left behind. A
> subsequent rebind cannot recreate them with the same fwnode-derived
> name.
> 
> [...]

Applied, thanks!

[1/1] phy: apple: atc: Fix typec switch/mux leak on unbind
      commit: 1854082fe0ddb81bc93d1f8e8a00554217fd09d1

Best regards,
-- 
~Vinod


