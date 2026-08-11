Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C361336B90C;
	Tue, 11 Aug 2026 21:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485053; cv=none; b=Ac82dC+GyLWrhd19vivAC/amOEssPb7VztKuX+khW1GWj2wIq1LzYGHS8baMMqMQRNwNon7ZtPC0JEotrWf8KU44wnuUqz2I++eJpy2Jvc4QNJV25nInRP04h/xXuBNnNn/TFDE/xyLhAPqiZK6rs43/l1tVk0uIXXABfY8e9rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485053; c=relaxed/simple;
	bh=oNotUDNgQ8UZjenFwsyWnUMmTe/fyWUngSnL9ho6ZJU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=moBni5XPse1SkPCGBZx0vVcRwtTUdckiPQ23ce/rcR7gJUt7WfAsK586g4vmNYyUdockFiEOOUvgrD2O1e/rI2rUAdR/NHHgU0tEf13Y+Nwzb2GObOb62qxtyblSKBpq2JiFyH84xIZ+mijc86yoj44/bxLfv2zXPeJc3QL074E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEMTPOnN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEMTPOnN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499C61F000E9;
	Tue, 11 Aug 2026 21:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786485052;
	bh=J3oMfD0Rq+z8p5nHwNCV4j/eMEhapnPfZydoy6fPclM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=GEMTPOnNBIUotAhleac9wYSy745kJ2AxqFIDIXoc+FVtTc9xi94ZugIIe2RMHSwwz
	 oQEz4mHuMwfN4RnGWMg04Jn//gxlY9bqxa8voe4WGjrRobAI1Bd6hHdIx9zk52PJ6s
	 S7E3QYAd6UvI2TpDt+sbhWP5BeeSjF3s7e8T6+9TRyRefGqH2xouHzcuKC0MoFMRXS
	 o7kIGL1jMSGbxn0N+svDGMBOX6U4XhdafVuZoQ8AbVo5YyFbf3ttX4wgp+ktDj04WF
	 IBGQndww5oWBWrsOSQ2whb6yTn66TAzUPgiOiNk+6D/y3e2MTtK+UqAC2irirsyPK5
	 nn+WWvMSKExGA==
Date: Tue, 11 Aug 2026 16:50:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
 devicetree@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Christoph Hellwig <hch@lst.de>, Neal Gompa <neal@gompa.dev>, 
 Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>, 
 Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20260811-apple-nvme-t8132-v1-1-865be32e42c3@cyberchaos.dev>
References: <20260811-apple-nvme-t8132-v1-0-865be32e42c3@cyberchaos.dev>
 <20260811-apple-nvme-t8132-v1-1-865be32e42c3@cyberchaos.dev>
Message-Id: <178648505154.4642.5846109337375334027.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: nvme: Add apple,t8132-nvme-ans2
 compatible


On Tue, 11 Aug 2026 22:49:47 +0200, Yureka Lilian wrote:
> Add a new base compatible for the ANS2 NVMe on the Apple t8132 (M4) SoC,
> which uses a separate MMIO base for its NVMMU.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  .../devicetree/bindings/nvme/apple,nvme-ans.yaml   | 77 ++++++++++++++--------
>  1 file changed, 48 insertions(+), 29 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/nvme/apple,nvme-ans.example.dtb: nvme@7bcc0000 (apple,t8103-nvme-ans2): 'reg', 'reg-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/nvme/apple,nvme-ans.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260811-apple-nvme-t8132-v1-1-865be32e42c3@cyberchaos.dev

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

