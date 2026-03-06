Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C8F2FD1D0;
	Fri,  6 Mar 2026 01:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772759244; cv=none; b=qCSeEj9793OW1cbhK/G4e4iiXZ6QKCGANk/on5I6mI9OJ/SaLmwQzKhYBg0htML3W9BPVG5yneknoVzj2LfzCe7hIWk5+El929RHpkuwi/t9yblzDgdKgJyojY7RglBtP/Ue+qBWh7NhGohTnPt52laLTVzxBASoDid5EOTfvLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772759244; c=relaxed/simple;
	bh=GFw22hv0nK5LumC6KM0cU1KesUX8U5Cyli/4f2X+e8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fahG9K9Wn/FqDZx1lMRoIJqlfaQal8f/vYIHFWDoORet4iRWlGdwHPdIVsVAa5VbB1g4W71mxkVHIhbgcdleB3DBZfvjIjKe0HeJDUOgoRQXZnxZDOIf/kdL5yVf7FF0BlK72EluJcWOMv0PMOjCu6EGEHUCsLg7vdR5Uu4BLdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFVKmoED; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFVKmoED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B926CC116C6;
	Fri,  6 Mar 2026 01:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772759243;
	bh=GFw22hv0nK5LumC6KM0cU1KesUX8U5Cyli/4f2X+e8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFVKmoEDXMlQiSE7CY6ctT+R8lhUh3C+cE3vW+Z6rLnXG6lRpMFsWeyLrilcHvzqe
	 vp8WwzQBj5Q32SfkiUVUZ1O87LktV+KKWey+pCa5SMjUF6DW59i4amWL33VqnBcWZm
	 oXSTpWwdKo/+yzX9PuTCcoIDnTw4WYvb/E84iY2zWEUCDXAxd6UpETi1HEeD/XSMP+
	 OdirSdNaMeGAX1pAaIl1L4BhnoA2yPQGIT0OcC3DOa7eff05koadjlGo9y/4tjQR1B
	 Gjhy6Wp2Kq5BSyuU1BW9D9raGjD/GOUKVJYOvGTS0/YNR3X6LzGtYVbKsaLf0UNUxG
	 B3lM/qEkz6QgA==
Date: Thu, 5 Mar 2026 19:07:22 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: linux-kernel@vger.kernel.org, Shenghao Ding <shenghao-ding@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org, asahi@lists.linux.dev,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Kevin Lu <kevin-lu@ti.com>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
Message-ID: <177275924228.907103.4367357392721304661.robh@kernel.org>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-1-c6ac5351489a@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-tdm-idle-slots-v3-1-c6ac5351489a@gmail.com>


On Sun, 01 Mar 2026 18:05:20 +1000, James Calligeros wrote:
> This schema was still in plaintext form. Convert to YAML format.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/tdm-slot.txt          | 29 ----------------------
>  .../bindings/sound/tdm-slot.yaml         | 33 +++++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 29 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

