Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D532F25F3;
	Fri,  6 Mar 2026 01:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772759256; cv=none; b=ALCdWgQLLlbUSNK2DpNt1jSAwUNiyAetWAvHjreVEUsHUvISSIrmfsu83OmsaBGBOrd4bm9v+xAT89U8PxaY1WM+Rs+nE1mr4UaupTO7hSCd6YOQbOs+9HkFjGuYWvu7cPnI/N+Ei2n0slvWChcXQaAvahpZ2yBWs6CylaDa+d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772759256; c=relaxed/simple;
	bh=z4HAlmfWQOzRiBcoGIB7Q03RvJNuqThL39CBgE2qsQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lxd7Z08TO34a/0RAHSj6rCwLNLmqUphS9L/rMNRNohyIXHn5pj1sNUxZfIi/xMJ0zwJECjn7btjaHpV3vkdM93+nPFNjethtIf4K/+dfNpiTmH9vIA/hseQh2rbT44H8UpNXIML+SV8Fhv9CcJowtSDDCDIej9x6n6o5cXWAbfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVBdL4Jb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVBdL4Jb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE7BC116C6;
	Fri,  6 Mar 2026 01:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772759256;
	bh=z4HAlmfWQOzRiBcoGIB7Q03RvJNuqThL39CBgE2qsQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVBdL4JbvNDpAyuFRvZ4/vfZMSnu/DOz00U914ktPjcw25bz52wXCvzP6ewL5u6R5
	 Nx7uVkwPkXEP//pyRcA2eI1OLDS1VwRRzl+c4dV/Cdxolaf7GgEJsz5MgP1gUrSfeD
	 VU3koytaulSA8xghO/zH0OymywkkRdjnuu2N6v4vQcLOZ1ueg6Uw5kMp2VzijUqK5d
	 qIFFD6RZYUIQM+QB3c+1ctLSWojQ64qRo8dX3Bh+mGaTDMf6RDtO+6vxacaipPCp0G
	 zEaeTrAO4YQYJCt5BpK/cn5xZvpwbb2uEyab5r8eKA19i1U668Fo8aVvW8oDWBdmlI
	 A5KDJ4s3leZJg==
Date: Thu, 5 Mar 2026 19:07:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	imx@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	asahi@lists.linux.dev, Shenghao Ding <shenghao-ding@ti.com>,
	linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/7] ASoC: dt-bindings: update tdm-slot.txt references
 to tdm-slot.yaml
Message-ID: <177275925396.907435.14412144819851551606.robh@kernel.org>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-2-c6ac5351489a@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-tdm-idle-slots-v3-2-c6ac5351489a@gmail.com>


On Sun, 01 Mar 2026 18:05:21 +1000, James Calligeros wrote:
> Ensure that all references to tdm-slot.txt have been updated to
> tdm-slot.yaml, and are schema-compliant.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/imx-audio-card.yaml   |  9 +++------
>  .../bindings/sound/simple-card.yaml      | 14 ++------------
>  2 files changed, 5 insertions(+), 18 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

