Received: from apollo.alba.sh (apollo.alba.sh [35.181.159.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0491F472F86
	for <asahi@lists.linux.dev>; Fri,  7 Aug 2026 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.181.159.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102711; cv=none; b=GccthFFyLEUNsb2gfWgCAbAtKzmBP+piqtTgTi6spSb7PxPekl+FpJEtAe3NVyDHkrBzTms4oVtu3DCrB/8Z0+LuAIt0RmaetfkHh8FpTm0W1pCF6xMMnNee0GlgP/R5qcYVqVGHb3Y18ZyVwBvJN7PVkhhzt6fiJLlEQLK/vhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102711; c=relaxed/simple;
	bh=NSrUJquvrSccqXHAmgU+zqqV/ladD/Gwl5pBSrjfglg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MbvC5f1KagqILIr3n5doeyYZq4QIJ1eqeHE2ToF8C5CaeLE6TS7whcqBGgAtz/ReT6b8xLEADBEFyBgGF1vJXkb6sOzudV6YlKCfqZgiC4W1zN6ugy864AhNIGsg5jkH0XYHxM9hzbiYL/Nksbg5lb/VbRGSlOCPpZr3GMYy0lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alba.sh; spf=pass smtp.mailfrom=alba.sh; dkim=pass (1024-bit key) header.d=alba.sh header.i=@alba.sh header.b=oGHJ56yl; arc=none smtp.client-ip=35.181.159.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alba.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alba.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=alba.sh header.i=@alba.sh header.b="oGHJ56yl"
Received: (Haraka outbound); Fri, 07 Aug 2026 11:37:09 +0000
Authentication-Results: apollo.alba.sh;
	auth=pass (cram-md5);
	spf=fail smtp.mailfrom=alba.sh
Received-SPF: Fail (apollo.alba.sh: domain of alba.sh does not designate 213.195.115.95 as permitted sender) receiver=apollo.alba.sh; identity=mailfrom; client-ip=213.195.115.95 helo=[192.168.1.141]; envelope-from=<me@alba.sh>
Received: from [192.168.1.141] ([213.195.115.95])
	by apollo.alba.sh (Haraka/2.8.28) with ESMTPSA id 3D6224CC-7F78-4701-A942-C0988D5AF2E0.1
	envelope-from <me@alba.sh>
	tls TLS_AES_256_GCM_SHA384 (authenticated bits=0);
	Fri, 07 Aug 2026 11:37:09 +0000
Message-ID: <817d6072b868c25f0862dfac7851ca39aae3429b.camel@alba.sh>
Subject: Re: [PATCH v4 4/6] spmi: apple: Implement remaining commands
From: Alba Mendez <me@alba.sh>
To: Janne Grunau <j@jannau.net>, Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, Stephen Boyd	
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org
Date: Fri, 07 Aug 2026 13:37:08 +0200
In-Reply-To: <20260805121956.GD832571@robin.jannau.net>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
	 <20260805-t603x-spmi-v4-4-c15a12d9a7d1@chaosmail.tech>
	 <20260805121956.GD832571@robin.jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1;a=rsa-sha256;bh=NSrUJquvrSccqXHAmgU+zqqV/ladD/Gwl5pBSrjfglg=;c=relaxed/simple;d=alba.sh;h=from:subject:date:message-id:to:cc:mime-version;s=main;b=oGHJ56ylTZOsm1X+SNtngtwlAerXbxYM8H3FcRUcYuSexzAODUkh0h/srSikGBaW5ACGP9YBSjOQG8pjs3CV9qnX9gGAkbBt/we8Mp230FaKi+5iW2ouivDCluHFBks+6FCDU1Zd0UQMaTG5WSqXxfrr1FaWUQ7bWcFansy4U0o=

On Wed, 2026-08-05 at 14:19 +0200, Janne Grunau wrote:
> On Wed, Aug 05, 2026 at 12:11:14PM +0200, Sasha Finkelstein wrote:
> > From: Alba Mendez <me@alba.sh>
> >=20
> > Add support for zero write and power management commands
>=20
> missing dot at the end of the sentence.
>=20
> > Signed-off-by: Alba Mendez <me@alba.sh>
> > Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> > ---
> > =C2=A0drivers/spmi/spmi-apple-controller.c | 114
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > +----------------------------------------------
> > =C2=A01 file changed, 68 insertions(+), 46 deletions(-)
> >=20
> > diff --git a/drivers/spmi/spmi-apple-controller.c
> > b/drivers/spmi/spmi-apple-controller.c
> > index 7ebf899edf17..49827e51e93e 100644
> > --- a/drivers/spmi/spmi-apple-controller.c
> > +++ b/drivers/spmi/spmi-apple-controller.c
> > @@ -46,9 +46,9 @@ struct apple_spmi {
> > =C2=A0	readl_poll_timeout((spmi)->regs + (reg), (val), (cond), \
> > =C2=A0			=C2=A0=C2=A0 REG_POLL_INTERVAL_US,
> > REG_POLL_TIMEOUT_US)
> > =C2=A0
> > -static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 saddr,
> > size_t len)
> > +static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 param)
> > =C2=A0{
> > -	return opc | sid << 8 | saddr << 16 | (len - 1) | (1 <<
> > 15);
> > +	return opc | sid << 8 | (u32)param << 16 | (1 << 15);
> > =C2=A0}
> > =C2=A0
> > =C2=A0/* Wait for Rx FIFO to have something */
> > @@ -69,14 +69,14 @@ static int apple_spmi_wait_rx_not_empty(struct
> > spmi_controller *ctrl)
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > -static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8
> > sid,
> > -			 u16 saddr, u8 *buf, size_t len)
> > +static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8
> > sid,
> > +			 u16 param, const u8 *buf, size_t len, u8
> > *ibuf, size_t ilen)
>=20
> Instead of two sets of not very distinctive variable names
> ("buf"/"len",
> "ibuf"/ilen") please use just buf/len and a boolean to indicate
> whether
> the command is a read or write if you insists of routing all commands
> through a single function. This can be simply added as first
> condition
> in the "while" iterating over the write/read buffers.

Hmm, even if constness was not an issue, I would still prefer if
buf/len and ibuf/ilen were kept separate... There are SPMI commands
with both controller-sent and peripheral-sent data frames (like
authentication) it just so happens that all the commands currently
implemented don't need data bytes in both directions. But the format of
the FIFO batches certainly seems prepared to acommodate those.

>=20
> > =C2=A0{
> > =C2=A0	struct apple_spmi *spmi =3D
> > spmi_controller_get_drvdata(ctrl);
> > -	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);
> > +	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, param);
> > =C2=A0	u32 reply, rsp;
> > =C2=A0	size_t len_read =3D 0;
> > -	u8 i;
> > +	size_t i =3D 0, j;
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	if (spmi->prev_fail) {
> > @@ -86,6 +86,14 @@ static int spmi_read_cmd(struct spmi_controller
> > *ctrl, u8 opc, u8 sid,
> > =C2=A0
> > =C2=A0	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> > =C2=A0
> > +	while (i < len) {
> > +		j =3D min_t(size_t, sizeof(spmi_cmd), len - i);
> > +		spmi_cmd =3D 0;
> > +		memcpy(&spmi_cmd, buf + i, j);
> > +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> > +		i +=3D j;
> > +	}
> > +
> > =C2=A0	ret =3D apple_spmi_wait_rx_not_empty(ctrl);
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > @@ -93,7 +101,7 @@ static int spmi_read_cmd(struct spmi_controller
> > *ctrl, u8 opc, u8 sid,
> > =C2=A0	reply =3D readl(spmi->regs + SPMI_RSP_REG);
> > =C2=A0
> > =C2=A0	/* Read SPMI data reply */
> > -	while (len_read < len) {
> > +	while (len_read < ilen) {
> > =C2=A0		if (readl(spmi->regs + SPMI_STATUS_REG) &
> > SPMI_RX_FIFO_EMPTY) {
> > =C2=A0			spmi->prev_fail =3D true;
> > =C2=A0			dev_err_ratelimited(&ctrl->dev,
> > @@ -101,11 +109,9 @@ static int spmi_read_cmd(struct
> > spmi_controller *ctrl, u8 opc, u8 sid,
> > =C2=A0			return -EIO;
> > =C2=A0		}
> > =C2=A0		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
> > -		i =3D 0;
> > -		while ((len_read < len) && (i < 4)) {
> > -			buf[len_read++] =3D ((0xff << (8 * i)) &
> > rsp) >> (8 * i);
> > -			i +=3D 1;
> > -		}
> > +		i =3D min_t(size_t, sizeof(spmi_cmd), ilen -
> > len_read);
> > +		memcpy(ibuf + len_read, &rsp, i);
> > +		len_read +=3D i;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (!(readl(spmi->regs + SPMI_STATUS_REG) &
> > SPMI_RX_FIFO_EMPTY)) {
> > @@ -113,54 +119,69 @@ static int spmi_read_cmd(struct
> > spmi_controller *ctrl, u8 opc, u8 sid,
> > =C2=A0		spmi->prev_fail =3D true;
> > =C2=A0	}
> > =C2=A0
> > -	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) &
> > ((1 << len) - 1)) {
> > +	if (!ilen && !FIELD_GET(SPMI_REPLY_ACK, reply)) {
> > +		dev_err(&ctrl->dev, "command not acknowledged\n");
> > +		return -EIO;
> > +	}
> > +	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) &
> > ((1 << ilen) - 1)) {
> > =C2=A0		dev_err(&ctrl->dev, "some frames failed parity
> > check\n");
> > =C2=A0		return -EIO;
> > =C2=A0	}
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > -static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8
> > sid,
> > -			=C2=A0 u16 saddr, const u8 *buf, size_t len)
> > +/* Send a raw command with 1..16 input data frames */
> > +static int spmi_raw_cmd_input(struct spmi_controller *ctrl, u8
> > opc, u8 sid,
> > +			 u16 param, u8 *buf, size_t len)
> > =C2=A0{
> > -	struct apple_spmi *spmi =3D
> > spmi_controller_get_drvdata(ctrl);
> > -	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);
> > -	u32 reply;
> > -	size_t i =3D 0, j;
> > -	int ret;
> > -
> > -	if (spmi->prev_fail) {
> > -		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs +
> > SPMI_RSP_REG);
> > -		spmi->prev_fail =3D false;
> > -	}
> > -
> > -	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> > +	return spmi_raw_cmd(ctrl, opc, sid, param, NULL, 0, buf,
> > len);
> > +}
> > =C2=A0
> > -	while (i < len) {
> > -		j =3D 0;
> > -		spmi_cmd =3D 0;
> > -		while ((j < 4) & (i < len))
> > -			spmi_cmd |=3D buf[i++] << (j++ * 8);
> > +/* Send a raw command with (optional) body and an input ACK */
> > +static int spmi_raw_cmd_ack(struct spmi_controller *ctrl, u8 opc,
> > u8 sid,
> > +			=C2=A0 u16 param, const u8 *buf, size_t len)
> > +{
> > +	return spmi_raw_cmd(ctrl, opc, sid, param, buf, len, NULL,
> > 0);
> > +}
> > =C2=A0
> > -		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> > +static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8
> > sid,
> > +			 u16 saddr, u8 *buf, size_t len)
> > +{
> > +	switch (opc) {
> > +	case SPMI_CMD_EXT_READ:
> > +	case SPMI_CMD_EXT_READL:
> > +		return spmi_raw_cmd_input(ctrl, opc | (len - 1),
> > sid, saddr, buf, len);
> > +	case SPMI_CMD_READ:
> > +		return spmi_raw_cmd_input(ctrl, opc | saddr, sid,
> > saddr, buf, len);
> > =C2=A0	}
> > +	return -EINVAL;
> > +}
> > =C2=A0
> > -	ret =3D apple_spmi_wait_rx_not_empty(ctrl);
> > -	if (ret)
> > -		return ret;
> > -
> > -	reply =3D readl(spmi->regs + SPMI_RSP_REG);
> > -
> > -	if (!(readl(spmi->regs + SPMI_STATUS_REG) &
> > SPMI_RX_FIFO_EMPTY)) {
> > -		dev_warn(&ctrl->dev, "FIFO has extra data\n");
> > -		spmi->prev_fail =3D true;
> > +static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8
> > sid,
> > +			=C2=A0 u16 saddr, const u8 *buf, size_t len)
> > +{
> > +	switch (opc) {
> > +	case SPMI_CMD_WRITE:
> > +		return spmi_raw_cmd_ack(ctrl, opc | saddr, sid,
> > buf[0] << 8 | saddr, NULL, 0);
> > +	case SPMI_CMD_ZERO_WRITE:
> > +		return spmi_raw_cmd_ack(ctrl, opc | buf[0], sid,
> > buf[0] << 8 | saddr, NULL, 0);
> > +	case SPMI_CMD_EXT_WRITE:
> > +	case SPMI_CMD_EXT_WRITEL:
> > +		return spmi_raw_cmd_ack(ctrl, opc | (len - 1),
> > sid, saddr, buf, len);
> > =C2=A0	}
> > +	return -EINVAL;
> > +}
> > =C2=A0
> > -	if (!FIELD_GET(SPMI_REPLY_ACK, reply)) {
> > -		dev_err(&ctrl->dev, "command not acknowledged\n");
> > -		return -EIO;
> > +static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
> > +{
> > +	switch (opc) {
> > +	case SPMI_CMD_RESET:
> > +	case SPMI_CMD_SLEEP:
> > +	case SPMI_CMD_SHUTDOWN:
> > +	case SPMI_CMD_WAKEUP:
> > +		return spmi_raw_cmd_ack(ctrl, opc, sid, 0, NULL,
> > 0);
> > =C2=A0	}
> > -	return 0;
> > +	return -EINVAL;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int apple_spmi_probe(struct platform_device *pdev)
> > @@ -183,6 +204,7 @@ static int apple_spmi_probe(struct
> > platform_device *pdev)
> > =C2=A0
> > =C2=A0	ctrl->read_cmd =3D spmi_read_cmd;
> > =C2=A0	ctrl->write_cmd =3D spmi_write_cmd;
> > +	ctrl->cmd =3D spmi_cmd;
> > =C2=A0
> > =C2=A0	ret =3D devm_spmi_controller_add(&pdev->dev, ctrl);
> > =C2=A0	if (ret)
>=20
> looks good otherwise
>=20
> Janne
