Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9AF2D6E63;
	Tue,  9 Dec 2025 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765276704; cv=none; b=ax6Y2WR3lpUtR2OlLhz0/Z39mes7vU1LsWFkcf9qkiDGVd4Kv7WH8tAq7edNFVJOrBcSZPVHjljeznet3/und12iL63KTWCnVh+TSMOzf+TDYjhuZNqdMk5mhGgknSt72ELEqx354re1GfXF6/cuaa7STAaKoPwWSUrbRQ1pUPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765276704; c=relaxed/simple;
	bh=0AldE0zmudZtS5j9/Fi6Xn2S6A7u+R+fpHODYTSagE4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=jSyVxoNzcAfvBUP7RDrFsqSCpO2e2v1IgdjUOO9PD1b+SppFbpSHKFWllLWkXCH2vH+Kne4B1UNG4o3AmlzCB1oudRaFxfKA0zHTs5SO0G/v2jtskk1apf9zbAv0j2Efbpmz2Edva9OXwTGLxbCJQM0vCJeV87X/aHG54PDJyN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSI6KJZZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSI6KJZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD4BC4CEF5;
	Tue,  9 Dec 2025 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765276703;
	bh=0AldE0zmudZtS5j9/Fi6Xn2S6A7u+R+fpHODYTSagE4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iSI6KJZZAboYannqD6vuGwtPFM0oKZPDhhlkryiYdEhGklsjcQDUochxfw8+5tqbS
	 LACATB/psLez/OLRkawr/gzZfD27H1usH9FUnNuwctQmWET/wodg+Kw5+eMxQ6NLBd
	 N1Y2DIx1HZel+8Y75RnLYxLpIrh+UloI7NiwheYoRfjnTFyVDgN/va2Z/7yQx1Z184
	 ZELoSCq42AuJa7YlseYxeXjYpaI0O8YB5mT2+rs2WZIek4v0GvoSeUEAiqzhFA7Q6K
	 di0gpkOCvc82gdBO2IKarZ/rbDDQjUn41cNDSIBzse3VKN1l746pxlZkYX/1164jr1
	 Qx3nWthR7kPQQ==
Date: Tue, 09 Dec 2025 04:38:20 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kevin Lu <kevin-lu@ti.com>, Fabio Estevam <festevam@gmail.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
To: James Calligeros <jcalligeros99@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-1-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
 <20251209-tdm-idle-slots-v1-1-38dabf6bc01e@gmail.com>
Message-Id: <176527670059.4068182.12113080556311230046.robh@kernel.org>
Subject: Re: [PATCH 1/7] ASoC: dt-bindings: convert tdm-slot to YAML


On Tue, 09 Dec 2025 19:31:14 +1000, James Calligeros wrote:
> This schema was still in plaintext form. Convert to YAML format.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/tdm-slot.txt          | 29 ---------------------
>  .../bindings/sound/tdm-slot.yaml         | 34 +++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 29 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tdm-slot.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tdm-slot.yaml: 'anyOf' conditional failed, one must be fixed:
	'properties' is a required property
	'patternProperties' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251209-tdm-idle-slots-v1-1-38dabf6bc01e@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

