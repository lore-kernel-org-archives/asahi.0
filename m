Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24EC175A8D
	for <asahi@lists.linux.dev>; Sun, 14 Jun 2026 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781439905; cv=none; b=GqM19Vj/P4T4OMkPnTAyXy5bAp0PFQ4w9u8sP+IGDE1c4V7vAVrPL96dNnPuXkb4q/f98nmCehRFXNbROIyoNLU3VbrIGvJUzPFXD2zh4hcfdfC06sl5hGAviKZPo3R45Uk2BGkEtYq8zHg/6az7bU4wzlnXAJ+NxHsFGm36c9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781439905; c=relaxed/simple;
	bh=BzMMkYlPDCwV477xB7vwpqVM8xhOxp538C7vpKxiwVY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bRJcaT7qh5NUN8dmdjkv8KI13xTJ8SMgzDR9BYTEZXRrAMVErANHKdbwyvH6rZkCuRfFZ5MVwN3Z3Hn3pvvMfLMmIpgwnTsJQqD6FQLIWHACPs6jWSS8Vlcj8rSpZ33KSVmxacqCxBkg9S/XG10HIjt/1WjTbp1bb1h6PEgv0E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=DPXV4aNi; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="DPXV4aNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1781439903;
 bh=s+Du+jaKu/RR1Vvr2XxT1BW3j9OgYSNRMzvt2kqdclc=;
 b=DPXV4aNiaiDX2YqE8qf0i5lpRPQKQbPc3iaBvUGBZkoX3scJweYuBx2RIKL0jpggI9gAJOQa7
 N38zELQNi2HqqMp9YjQHQ6J/wwk4oxThATzJPbh6B/GvSf0gX70KT76aNT5a44YqcQz7zh5Lu0Y
 BkxzBYEYPLNTpd6nsUvdUlqysQJb0gB/sa8bN3BXceWx7qX0HfS8SnSA52tHZYEc24NevKXPScj
 prJ99UgVSuRnpEg+VqadFIt6+b3vwqPArVbdwoVEe6j7rAHTeFDyZM8HD7zU5GYJLp9BKrnPXVF
 7oJ3f5MP2VQ/Tc2CDz80V3msCrp5xBieSZnHcZIGnQcA==
X-Forward-Email-ID: 6a2e9d9143cb3b89dce1feae
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.26
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 14 Jun 2026 08:24:48 -0400
Message-Id: <DJ8RQIPC5TW4.G2XIVOQPSXCK@ubuntu.com>
Cc: <linux-kernel@vger.kernel.org>, "Janne Grunau" <j@jannau.net>,
 <linux-arm-kernel@lists.infradead.org>, <linux-input@vger.kernel.org>,
 "Sven Peter" <sven@kernel.org>, <asahi@lists.linux.dev>, "Neal Gompa"
 <neal@gompa.dev>
Subject: Re: [PATCH v2] Input: apple_z2 - bound the device-reported finger
 count
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: <hexlabsecurity@proton.me>, "Sasha Finkelstein" <k@chaosmail.tech>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260613-b4-disp-4ebcbd68-v2-1-0161acfbd688@proton.me>
In-Reply-To: <20260613-b4-disp-4ebcbd68-v2-1-0161acfbd688@proton.me>

On Sat Jun 13, 2026 at 9:22 PM EDT, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
>
> apple_z2_parse_touches() takes the finger count from the touch
> controller's report and loops over that many fixed-size finger records
> without ever checking the count against the length of the report:
>
> 	nfingers =3D msg[APPLE_Z2_NUM_FINGERS_OFFSET];
> 	fingers =3D (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
> 	for (i =3D 0; i < nfingers; i++)
> 		/* read fingers[i] ... */
>
> msg points into the fixed 4000-byte z2->rx_buf and nfingers is a single
> device-supplied byte, so it can be as large as 255.  A malicious,
> malfunctioning or counterfeit controller (or an interposer on the SPI
> bus) can report a large finger count in a short packet, making the loop
> read up to 255 * sizeof(struct apple_z2_finger) bytes starting 24 bytes
> into msg -- far past the 4000-byte buffer.  This is a controller-driven
> heap out-of-bounds read, and the finger fields that are read (position,
> pressure, touch and tool dimensions) are forwarded to userspace as input
> events, leaking adjacent kernel memory.
>
> Bound the device-reported count to the number of finger records the
> report actually carries.
>
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/all/20260613215358.329921F000E9@smtp.kern=
el.org/
> Fixes: 471a92f8a21a ("Input: apple_z2 - add a driver for Apple Z2 touchsc=
reens")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
> ---
> Changes since v1 [1]:
> - Keep the early-return at NUM_FINGERS_OFFSET instead of moving it to
>   FINGERS_OFFSET, so a short zero-finger ("all lifted") report still
>   reaches input_mt_sync_frame()/input_sync() and does not leave touches
>   stuck on the screen (caught by the sashiko-bot review of v1 [2]).  A
>   packet too short to hold even one finger record clamps nfingers to 0
>   instead of being dropped.
>
> [1] https://lore.kernel.org/all/20260613-b4-disp-f0148c89-v1-1-868a48b2a1=
87@proton.me/
> [2] https://lore.kernel.org/all/20260614000725.6B8D11F000E9@smtp.kernel.o=
rg/
>
> Reachable on every touch interrupt once the controller is booted
> (apple_z2_irq -> apple_z2_read_packet -> apple_z2_parse_touches).
>
> nfingers is bounded here by the message length; the message length is in
> turn bounded by the companion "Input: apple_z2 - bound the device-reporte=
d
> packet length" change (in flight), which caps the device-reported pkt_len
> to the 4000-byte receive buffer.  The two together close the device-drive=
n
> out-of-bounds accesses in apple_z2_parse_touches() / apple_z2_read_packet=
().
>
> Verified with a faithful in-kernel KASAN litmus (the verbatim 4000-byte
> buffer, the struct apple_z2_finger layout and the parse loop),
> CONFIG_KASAN=3Dy on x86_64:
>
>   Arm A, nfingers =3D 255 in a short packet (msg_len 19):
>     BUG: KASAN: slab-out-of-bounds in apple_z2_parse_touches
>     Read of size 2 ... 1 bytes to the right of allocated 4000-byte region
>     ... cache kmalloc-4k of size 4096
>   Arm B, with this patch: a zero-finger report (msg_len 19) reaches the
>     sync; a 255-finger claim is clamped to what the packet holds; clean.
>   Arm C, benign device (3 fingers): clean
>
>   AddressSanitizer (x86_64 and i386): heap-buffer-overflow READ, both ABI=
s.
>
> Reproducer and full logs available on request.
> ---
>  drivers/input/touchscreen/apple_z2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchsc=
reen/apple_z2.c
> index 271ababf0ad5..39ade83ef0de 100644
> --- a/drivers/input/touchscreen/apple_z2.c
> +++ b/drivers/input/touchscreen/apple_z2.c
> @@ -92,6 +92,12 @@ static void apple_z2_parse_touches(struct apple_z2 *z2=
,
>  		return;
>  	nfingers =3D msg[APPLE_Z2_NUM_FINGERS_OFFSET];
>  	fingers =3D (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
> +	/* a malicious controller can claim more fingers than the packet holds =
*/
> +	if (msg_len < APPLE_Z2_FINGERS_OFFSET)
> +		nfingers =3D 0;
> +	else
> +		nfingers =3D min_t(int, nfingers,
> +				 (msg_len - APPLE_Z2_FINGERS_OFFSET) / sizeof(*fingers));
>  	for (i =3D 0; i < nfingers; i++) {
>  		slot =3D input_mt_get_slot_by_key(z2->input_dev, fingers[i].finger);
>  		if (slot < 0) {
>
> ---
> base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
> change-id: 20260613-b4-disp-4ebcbd68-ed8a28672ccc
>
> Best regards,

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
